require "rails_helper"

RSpec.feature "Users signin" do
  before do
    @john = User.create!(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
  end

  scenario "with valid credentials" do
    visit "/"
    click_link "Log In"

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button "Log In"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
  end
end

