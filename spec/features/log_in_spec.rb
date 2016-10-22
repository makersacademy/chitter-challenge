require 'spec_helper'

feature "Log in" do
  scenario "users can log in" do
    sign_up
    visit '/'
    fill_in('user_name', :with => "William")
    fill_in('password', :with => "123456")
    click_button('Log in')
    expect(page).to have_content("Welcome, #{ User.first.user_name }")
  end
end
