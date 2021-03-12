class StyleguideController < ApplicationController
  include RolesHelper

  before_action :ensure_authenticated
  before_action :ensure_user_admin_role_access

  def index
  end

  def atoms
  end

  def molecules
  end

  def organisms
  end

end
