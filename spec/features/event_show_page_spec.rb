# Feature: Event page
#   As a visitor
#   I want to visit a event page
#   So I can learn more about the event
require "rails_helper"

RSpec.feature 'Event page' do
  # Scenario: Visit the event page
  #   Given I am a visitor
  #   When I visit the event page
  #   Then I see "..."
  scenario 'visit the event page' do
    visit event_path
    fail "Add a test to make sure we are on this page"
    expect(page).to have_attributes(:hero_image_url)
    # expect(page).to have_content #...
  end
end
