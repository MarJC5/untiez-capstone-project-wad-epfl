class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale}
  end

  add_flash_types :info, :error, :success

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    if(@current_user.present?)
        return @current_user
    end

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

 private

  def ensure_authenticated
    if logged_in?
     return
    else
      flash[:error] = t('user.alert.please_login')
      redirect_to login_path
    end
  end

end
