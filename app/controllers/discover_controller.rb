class DiscoverController < ApplicationController

  before_action :set_post_view_action

  def photoshoots
    @posts = Post.photoshoots_list.page(params[:page])
  end

  def tips
    @posts = Post.tips_list.page(params[:page])
  end

  def trips
    @posts = Post.trips_list.page(params[:page])
  end

  private

  def set_post_view_action
    @post = Post.new
    @user_suggestion = User.suggestion(current_user)
  end

end
