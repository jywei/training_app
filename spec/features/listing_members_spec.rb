require "rails_helper"

RSpec.feature "Listing members" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@example.com", password: "password")
  end

  scenario "Show a list of registered memebers" do
    visit "/"

    expect(page).to have_content("Strivers' List")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jane.full_name)
  end

end
