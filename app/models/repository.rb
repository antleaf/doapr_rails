class Repository < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  belongs_to :business_model, optional: true
  belongs_to :country, optional: true
  belongs_to :platform, optional: true
  belongs_to :status, optional: true
  has_and_belongs_to_many :disciplines
end
