class TripsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    user = User.friendly.find(params[:user_id])
    user.trips << post
    redirect_to(post_path(post))
  end

  def destroy
    user = User.find(current_user.id)
    post = Post.find(params[:post_id])
    user.trips.delete(post)

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      flash[:info] = I18n.t('post.alert.leave_trip')
    end
  end

end
