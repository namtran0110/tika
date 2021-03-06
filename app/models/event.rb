class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user, :foreign_key => "user_id"
  has_many :ticket_types
  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :publish
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  searchkick

  scope :upcoming, -> { where("starts_at > ?", Time.now) }

  def search_data
    {
        name: name,
    }
  end

  delegate :name, to: :venue, allow_nil: true, prefix: true
  # def venue_name
  # end
end
