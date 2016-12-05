require 'spec_helper'

feature 'User signs out' do

  before(:each) do
    User.create(name: "Isabel",
                username: "Isabel",
                email: 'isabel@example.com',
                password: 'test',
                password_confirmation: 'test')

  end


  scenario "user can log out after logging in" do
    log_in
    click_button("Log out")
    expect(page).not_to have_content("/Log out")
  end
end
