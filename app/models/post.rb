class Post < ApplicationRecord
  # Add votation
  acts_as_votable

  # Post structur
  belongs_to :user
  belongs_to :category
  has_many   :comments, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  # Post creation options
  validates :title, length: { maximum: 100 }, presence: true

  # Pagniation options
  paginates_per 6

  # Post image -> carrierwave
  mount_uploader :image, ImageUploader

  # Create list of user suggestion excluding current_user
  scope :suggestion, ->(user) { order("RANDOM()").limit(6).where.not(id: user) }

  # Create list of photoshoots
  scope :tips_list, ->() { order(created_at: :desc).where(category: 2) }
  scope :trips_list, ->() { order(created_at: :desc).where(category: 3) }
  scope :photoshoots_list, ->() { order(created_at: :desc).where(category: 4) }

  # Last posts
  scope :last_posts, ->(user) { order(created_at: :desc).limit(3).where(user_id: user) }

  # Post search term options
  def self.search(search_term)
    user_filter = "%#{search_term}%"
    # Search term matching with database
    where('title LIKE ?', user_filter).or(where('location LIKE ?', user_filter))
  end

end
