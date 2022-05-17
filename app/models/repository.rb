class Repository < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  belongs_to :business_model
  belongs_to :owner_country, class_name: 'Country'
  belongs_to :platform
  belongs_to :status
end
