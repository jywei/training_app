require "rails_helper"

RSpec.feature "Listing exercises" do

  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    @sarah = User.create(email: "sarahd@example.com", password: "password", first_name: "Sarah", last_name: "Doe")
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Back day", workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 30, workout: "Chest day", workout_date: Date.today)

    @following = Friendship.create(user: @john, friend: @sarah)

  end

  scenario "Show user's workout for last 7 days" do
    visit "/"
    click_link "My Locker"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end

  scenario "Show a list of friends" do
    visit "/"
    click_link "My Locker"

    expect(page).to have_content("My Buddies")
    expect(page).to have_content(@sarah.first_name)
    expect(page).to have_link("Unfollow")
  end

end
