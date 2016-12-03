require 'spec_helper'

feature "When users posts peeps" do

  before(:each) do
    User.create(name: "Isabel",
                user_name: "Isabel",
                email: 'isabel@example.com',
                password: 'test',
                password_confirmation: 'test')

  end

  scenario "A user can post a peep" do
    log_in
    fill_in("peep", :with => "My peep")
    click_button("Post")
    expect(page).to have_content("My peep")
  end
end
