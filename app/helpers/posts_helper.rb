module PostsHelper

  # Check if user has "join" the trips -> then switch button for "leave" in the view
  def is_member?
      if (current_user.present?)
        return current_user.trips.ids.include?(@post.id)
      end
  end

end
