class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  passwordless_with :email

  has_and_belongs_to_many :roles

  def has_role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
