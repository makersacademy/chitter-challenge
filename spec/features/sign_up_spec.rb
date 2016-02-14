require './spec/web_helper'

feature 'sign up' do

  scenario 'allows users to create an account' do
    expect {sign_up_good}.to change(User, :count).by(1)
  end

  scenario 'sends error message when email already used' do
    sign_up_good
    click_button 'Log Out'
    expect {sign_up_good}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'sends error message when invalid email' do
    expect {sign_up_invalid}.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'sends error message when passwords are inconsistant' do
    expect {sign_up_password_fail}.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user can see that they are signed in' do
    sign_up_good
    expect(page).to have_content 'SidTheSloth is logged in'
  end

  scenario 'usernames are unique' do
    sign_up_good
    click_button 'Log Out'
    expect {sign_up_username}.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end

end
