class Service < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :functions
  has_many :features

  enum cost: {
    completely_free: 0,
    free_with_premium_features: 1,
    premium_only: 2
  }
end
