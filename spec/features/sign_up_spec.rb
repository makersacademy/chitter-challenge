require 'spec_helper'

feature 'user sign up' do
  scenario 'user can sign up' do
    sign_up
    expect(page).to have_content('Welcome, suse!')
  end

  scenario 'on user sign-in increase user count by one' do
    sign_up
    expect(User.count).to eq 1
    end

  scenario 'sign up fails if password does not match password confiramtion' do
    visit '/'
    click_button('Sign up')
    fill_in "name", :with => "suse"
    fill_in "username", :with => "sus111"
    fill_in "email", :with => "suse@gmail.com"
    fill_in "password", :with => "monkey"
    fill_in "password_confirmation", :with => "wrong password"
    click_button "Sign me up!"
    expect(page).to have_content "Your passwords don\'t match"
  end

  scenario "sign up fails with an invalid email address" do
    visit '/'
    click_button('Sign up')
    fill_in "name", :with => "suse"
    fill_in "username", :with => "sus111"
    fill_in "email", :with => "invalid"
    fill_in "password", :with => "monkey"
    fill_in "password_confirmation", :with => "wrong password"
    click_button "Sign me up!"
    expect(User.count).to eq 0
 end

end
