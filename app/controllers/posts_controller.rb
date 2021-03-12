class PostsController < ApplicationController
  include RolesHelper

  before_action :set_post,               only: [:show, :edit, :update, :destroy, :like, :joiners]
  before_action :ensure_authenticated,   only: [:new, :edit, :update, :like]
  before_action :authorize_to_edit_post, only: [:edit, :update, :destroy]

  #This will allow it to respond to the calls coming from the view.
  respond_to :js, :html, :json

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @user_suggestion = User.suggestion(current_user)
    @post = Post.new

    # Ony render post in the infinite scrool as JSON
    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "application/posts/posts", formats: [:html]), pagination: view_context.paginate(@posts)}
      }
    end
  end

  def show

    unless current_user.present?
      redirect_to login_path
      flash[:info] = I18n.t('post.alert.please_login')
    end

    @comments = @post.comments.order(created_at: :desc).page(params[:page])

    if @post.location.present?
      @location = Geocoder.search(@post.location).first.coordinates
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.friendly.find(session[:user_id])

    respond_to do |format|
     if @post.save
       format.html { redirect_to @post }
       flash[:success] = I18n.t('post.alert.create')
     else
       format.html { render :new  }
       flash[:error] = I18n.t('post.alert.create_error')
     end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post }
        flash[:success] = I18n.t('post.alert.update')
      else
        format.html { render :edit }
        flash[:error] = I18n.t('post.alert.update_error')
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      flash[:info] = I18n.t('post.alert.destroy')
    end
  end

  def like
    if params[:format] == 'liked'
      @post.liked_by current_user
    elsif params[:format] == 'unliked'
      @post.unliked_by current_user
    end
  end

  def joiners
    @all_joiners = @post.users
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def authorize_to_edit_post
      redirect_to(root_path) unless(can_edit?(@post))
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, :location, :departure, :user_id, :category_id)
    end
end
