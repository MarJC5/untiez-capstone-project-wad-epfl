class Comment < ApplicationRecord
  # Comment structur
  belongs_to :post
  belongs_to :user

  # Comment creation options
  validates :body, presence: true

  # Comment pagination options
  paginates_per 4
end
