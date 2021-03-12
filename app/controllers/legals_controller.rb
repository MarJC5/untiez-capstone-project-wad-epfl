class LegalsController < ApplicationController

  include RolesHelper

  before_action :ensure_user_admin_role_access, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_legal,                     only: [:show, :edit, :update, :destroy]

  def index
    @legals = Legal.all
  end

  def show
    @legals = Legal.all
  end

  def new
    @legal = Legal.new
  end

  def create
    @legal = Legal.new(legal_params)

    respond_to do |format|
     if @legal.save
       format.html { redirect_to @legal, notice: I18n.t('legal.alert.create') }
     else
       format.html { render :new, notice: I18n.t('legal.alert.create_error')  }
     end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @legal.update(legal_params)
        format.html { redirect_to @legal, notice: t('legal.alert.update') }
      else
        format.html { render :edit, notice: t('legal.alert.update_error') }
      end
    end
  end

  def destroy
    @legal.destroy
    respond_to do |format|
      format.html { redirect_to legals_path, notice: t('legal.alert.destroy')}
    end
  end

  private

  def set_legal
    @legal = Legal.friendly.find(params[:id])
  end

  def legal_params
    params.require(:legal).permit(:title, :body)
  end

end
