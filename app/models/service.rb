class Service < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :functions
  has_many :features
  has_many :repositories, :through => :features

  enum cost: {
    completely_free: 0,
    free_with_premium_features: 1,
    premium_only: 2
  }

  def cost_name
    if completely_free? then
      'Completely Free'
    elsif free_with_premium_features? then
      'Free with Premium Features'
    else
      'Premium Only'
    end
  end
end
