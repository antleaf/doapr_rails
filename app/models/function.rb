class Function < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :services
  has_many :features
  has_many :repositories, :through => :features

end
