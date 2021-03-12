class SessionsController < ApplicationController

  def new
    @user = User.new

    # redirect if current_user is present
    redirect_to discover_path if session[:user_id].present?
  end

  def create
    user = User.find_by(email: params[:email])

    if(user.present? && user.authenticate(params[:password]))
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = I18n.t('session.alert.create') + user.firstname
    else
      flash[:error] = I18n.t('session.alert.create_error')
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
    flash[:info] = I18n.t('session.alert.logout')
  end

end
