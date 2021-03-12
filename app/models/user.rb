class User < ApplicationRecord

  # test if a given string contains at least a lowercase letter, a uppercase, a digit and 8+ chars
  has_secure_password

  #validates :password, format: { with:  /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{7,}/, message: I18n.t('user.alert.strong_password') }

  # Pagniation options
  paginates_per 6

  # Friendly route name
  extend FriendlyId
  friendly_id :pseudo, use: :slugged

  # Add votation user
  acts_as_voter

  # User requirement
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  # lowercase letter (a-z), number (0-9), dot and underscore.
  # {2,10} makes sure that are at least 3, but no more than 10
  # Must have at least one letter (?=.*?[a-z])
  validates :pseudo, presence: true,
                     uniqueness: true,
                     format: { with:  /[a-z0-9._](?=.*?[a-z]).{2,10}/, message: I18n.t('user.alert.missing_letter') }

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :location, presence: true

  validates :bio, length: { maximum: 100 }

  # Follow & Follower
  # It allows the foreign key follower_id to be accessed from the Follow class.
  # Enables a user to follow many other users.
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followees, through: :followed_users, dependent: :destroy
  # This next piece is the same as above, just for the reverse relationship
  # A user has many followers through the following_users established in the line above.
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :following_users, dependent: :destroy

  # User post
  has_many :posts, dependent: :destroy
  # User post comments
  has_many :comments, dependent: :destroy
  # Join multiple trip
  has_and_belongs_to_many :trips, class_name: 'Post', dependent: :destroy

  # Check & set current_user role type
  after_initialize :default_role!

  before_validation :downcase_email
  before_validation :downcase_pseudo

  validates :role, inclusion: { in: %w(registered admin) }

  # Create list of user suggestion excluding current_user
  scope :suggestion, ->(user) { order("RANDOM()").limit(5).where.not(id: user) }

  mount_uploader :avatar_upload, AvatarUploader

  # Set a default role to current_user if nil
  def default_role!
    self.role ||= 'registered'
  end

  # User search term options
  def self.search(search_term)
    user_filter = "%#{search_term}%"
    # Search term matching with database
    where('pseudo LIKE ?', user_filter).or(where('firstname LIKE ?', user_filter)).or(where('lastname LIKE ?', user_filter))
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def downcase_pseudo
    self.pseudo = pseudo.downcase
  end

end
