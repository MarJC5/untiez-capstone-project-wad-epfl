class SearchController < ApplicationController
  def index
    # Retrieve search term from the url => term is sent from input field
    @search_term = params[:q]
    # Filter all users regarding term and save them to @users => Search can be display to the view with @users
    @users = User.search(@search_term)
    # Filter all posts title
    @posts = Post.search(@search_term)
  end
end
