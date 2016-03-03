require "rails_helper"

RSpec.feature "Signing out signed-in user" do

  before do
    @john = User.create!(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    visit "/"

    click_link "Log In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"
  end

  scenario "A signed-in user wants to sign out" do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully")

  end
end
