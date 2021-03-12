class Legal < ApplicationRecord
  # Friendly route name
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :title, presence: true

  validates :body, presence: true
end
