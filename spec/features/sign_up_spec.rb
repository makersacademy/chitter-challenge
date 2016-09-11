require 'spec_helper'

feature 'sign up' do

  scenario 'a user can sign up' do
    visit '/sign_up'
    fill_in('email', with: 'james@test.com')
    fill_in('name', with: 'James Test')
    fill_in('username', with: 'Test_Username')
    fill_in('password', with: 'password1')
    fill_in('password_confirmation', with: 'password1')
    click_button('Sign up')
    expect(User.count).to eq(1)
    expect(page).to have_current_path("/")
  end

end
