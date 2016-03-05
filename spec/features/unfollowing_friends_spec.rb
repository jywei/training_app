require "rails_helper"

RSpec.feature "Unfollowing friends" do
  before do
    @john = User.create(first_name: "John", last_name: "Smith", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")

    login_as(@john)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario do
    visit "/"
    click_link "My Locker"

    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"

    find(link).click

    expect(page).to have_content(@sarah.full_name + " is unfollowed")
  end
end
