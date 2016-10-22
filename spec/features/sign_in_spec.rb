require 'spec_helper'

feature "Sign in" do
  scenario "users can sign in" do
    sign_up
    visit '/'
    fill_in('user_name', :with => "William")
    fill_in('password', :with => "123456")
    click_button('Sign in')
    expect(page).to have_content("Welcome, #{ User.first.user_name }")
  end
end
