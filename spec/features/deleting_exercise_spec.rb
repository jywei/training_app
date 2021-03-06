require "rails_helper"

RSpec.feature "Deleting exercises" do

  before do
    @owner = User.create(email: "owner@example.com", password: "password", first_name: "John", last_name: "Doe")

    @owner_exer = @owner.exercises.create(duration_in_min: 48,
                                          workout: "Cardio special",
                                          workout_date: Date.today)

    login_as(@owner)
  end

  scenario do
    visit "/"
    click_link "My Locker"
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end


end
