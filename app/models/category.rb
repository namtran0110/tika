class Category < ActiveRecord::Base
  has_many :events
  validates_inclusion_of :name, in: ['Entertainment', 'Learning', 'Historical', 'Startup', 'Developer']
  validates_uniqueness_of :name
end
