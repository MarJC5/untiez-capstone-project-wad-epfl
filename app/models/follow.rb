class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User' # Create the Follow (followee_id)
  belongs_to :followee, class_name: 'User' # Receive the Follow (follower_id)

  # By adding the class_name: ‘User’ to the end of the relationships, they become associated as sub-categories within the User class.

  # To ensure a user can only follow another user once and a user can only have one follow from another user.
  validates :follower_id, uniqueness: { scope: :followee_id }
  validates :followee_id, uniqueness: { scope: :follower_id }

end
