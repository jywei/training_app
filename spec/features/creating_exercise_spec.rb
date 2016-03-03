require "rails_helper"

RSpec.feature "Creating exercise" do

  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit '/'

    click_link "My Locker"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Details", with: "weight-lifting"
    fill_in "Activity Date", with: Date.today
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@john, exercise))
  end

  scenario "with invalid input" do
    visit '/'

    click_link "My Locker"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: nil
    fill_in "Details", with: ""
    fill_in "Activity Date", with: ""
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has not been created")

    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")

  end
end
