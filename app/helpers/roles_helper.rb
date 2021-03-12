module RolesHelper
  # Check user role for allow action
  def can_edit?(post)
    if(current_user.present?)
      case(current_user.role)
        when 'admin' then true
        when 'registered' then current_user == post.user
        else false
      end
    end
  end

  # Check user role for display more options in the view
  def is_admin?(user)
    if(current_user.present?)
      true if(current_user.role == 'admin')
    end
  end

  # Check the user role to allow action
    def ensure_user_admin_role_access
      user = User.find(session[:user_id])

      if user.role === 'admin'
        return
      else
        flash[:error] = t('user.alert.not_allowed')
        redirect_to root_path
      end
    end
end
