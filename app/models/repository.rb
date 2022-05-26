class Repository < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  belongs_to :business_model, optional: true
  belongs_to :country, optional: true
  belongs_to :status, optional: true
  has_and_belongs_to_many :disciplines
  has_and_belongs_to_many :countries
  has_many :features

  # enum business_model: {
  #   non_profit: 0,
  #   for_profit: 1
  # }
end
