require 'spec_helper'


feature "when logging in" do

  scenario "A user will be able to log in with ncorrect password" do
    sign_up
    visit("/log-in")
    fill_in("user_name", :with => "Isabel")
    fill_in("password", :with => "test")
    click_button("Log in")
    expect(page).to have_content("Welcome Isabel")
  end

  scenario "A user will not be able to log in with incorrect password" do
    sign_up
    visit("/log-in")
    fill_in("user_name", :with => "Isabel")
    fill_in("password", :with => "rest")
    click_button("Log in")
    expect(page).to have_content("Wrong password")
  end

  scenario "A user will be able to log out" do

  end
end
