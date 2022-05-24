class Service < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  enum cost: {
    completely_free: 0,
    free_with_premium_features: 1,
    premium_only: 2
  }
end
