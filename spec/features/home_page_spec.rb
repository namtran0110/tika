# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the upcoming events
require "rails_helper"

RSpec.feature 'Home page' do
  # Scenario: Visit the event page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see upcoming events
  scenario 'visit the event page' do
    visit root_path
    fail "something wrong"
    expect(page).to have_attributes(:name)
    # expect(page).to have_content #...
  end
end
