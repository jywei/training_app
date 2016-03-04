require "rails_helper"

RSpec.feature "Following friends" do

  before do

    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    @jane = User.create(email: "jane@example.com", password: "password", first_name: "Jane", last_name: "Doe")
    login_as(@john)

  end

  scenario "if signin success" do
    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jane.full_name)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")

    link = "a[href='/friendships?friend_id=#{@jane.id}']"
    find(link).click

    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@jane.id}")
  end

end
