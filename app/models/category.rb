class Category < ApplicationRecord
  # Category structur
  has_many :posts, dependent: :destroy

  # Category creation options
  validates :name, presence: true,
                   uniqueness: true
end
