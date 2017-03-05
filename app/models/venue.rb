class Venue < ActiveRecord::Base
  belongs_to :region
  has_many :events
  validates_uniqueness_of :name
end
