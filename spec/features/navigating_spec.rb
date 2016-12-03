require 'spec_helper'

feature "When navigating the site" do
  before(:each) do
    User.create(name: "Isabel",
                user_name: "Isabel",
                email: 'isabel@example.com',
                password: 'test',
                password_confirmation: 'test')

  end

  scenario "you have to be loggsed in to peep" do
    visit("/users/1")
    expect(page).to have_content("You need to login to peep!")
  end

end
