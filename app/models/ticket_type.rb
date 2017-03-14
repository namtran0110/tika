class TicketType < ActiveRecord::Base
  belongs_to :event
  validates :name, :presence => true
  validates :max_quantity, :presence => true
  validates :price, :presence => true

end
