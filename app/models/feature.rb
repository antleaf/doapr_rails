class Feature < ApplicationRecord
  belongs_to :repository
  belongs_to :function#, optional: true
  belongs_to :service, optional: true
end
