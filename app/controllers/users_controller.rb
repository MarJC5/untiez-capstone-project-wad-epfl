class UsersController < ApplicationController

  before_action :set_user,      only: [:show, :edit, :update, :destroy, :all_posts]
  before_action :ensure_user_role,   only: [:edit, :update, :destroy]
  before_action :ensure_authenticated,   only: [:show, :edit]

  def show
    @last_posts = Post.last_posts(@user)
    @joined_posts = @user.trips.limit(3)
  end
  
  def new
    @user = User.new

    # redirect if current_user is present
    redirect_to discover_path if session[:user_id].present?
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # Set random avatar if nil
        @user.avatar ||= "samples/avatar-#{rand(1..6)}.png"
        # Save user and redirect to his account page
        @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user }
        flash[:success] = I18n.t('user.alert.create')
      else
        format.html { render :new }
        flash[:error] = I18n.t('user.alert.create_error')
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(edit_user_params)
        format.html { redirect_to @user }
        flash[:success] = I18n.t('user.alert.update')
      else
        format.html { render :edit}
        flash[:error] = I18n.t('user.alert.update_error')
      end
    end
  end

  def destroy
    @user.destroy

    if current_user == @user
      session[:user_id] = nil
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
      flash[:info] = I18n.t('user.alert.destroy')
    end

  end

  def all_posts
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  def follow
    @user = User.friendly.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.friendly.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end


  private

  def set_user
      @user = User.friendly.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:pseudo, :email, :lastname, :firstname, :avatar_upload, :bio, :location, :password)
  end

  def edit_user_params
      params.require(:user).permit(:pseudo, :email, :lastname, :firstname, :avatar_upload, :bio, :location, :role, :password)
  end

  # Check the user to allow action
    def ensure_user_role
      user = User.friendly.find(params[:id])

      if user == current_user
        return
      elsif current_user.role == 'admin'
        return
      else
        redirect_to root_path
        flash[:error] = I18n.t('user.alert.not_allowed')
      end

    end

end
