require 'spec_helper'

feature 'user sign up' do

  let(:user) { build(:user) }
  let(:user_no_email) { build(:user_no_email) }
  let(:user_no_username) { build(:user_no_username) }

  scenario 'Sign up page exists' do
    visit '/users/new'
    expect(page).to have_content('Please sign up')
  end

  scenario 'I can sign up as a new user' do
    sign_up_as(user)
    expect(page).to have_content('logged in as: test_user_name')
    expect(User.first.email).to eq('test@example.com')
  end

  scenario 'I cannot sign up with an exisiting username' do
    create(:user)
    sign_up_as(user)
    expect(page).to have_content('User name is already taken')
  end

  scenario 'I cannot sign up with an exisiting email' do
    create(:user)
    sign_up_as(user)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'requires an email' do
    sign_up_as(user_no_email)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'requires an email' do
    sign_up_as(user_no_username)
    expect(page).to have_content 'User name must not be blank'
  end

end

feature 'User sign in' do

  scenario 'with correct credentials' do
    user = create(:user)
    sign_in_as(user)
    expect(page).to have_content "logged in as: #{user.user_name}"
  end

  scenario 'errors with incorrect password' do
    user = create(:user)
    wrong_user = build(:user_wrong_password)
    sign_in_as(wrong_user)
    expect(page).to have_content('The username or password is incorrect')
  end

  scenario 'errors with incorrect email' do
    user = create(:user)
    wrong_user = build(:user_wrong_username)
    sign_in_as(wrong_user)
    expect(page).to have_content('The username or password is incorrect')
  end

end

feature 'User signs out' do

  scenario 'while being signed in' do
    user = create(:user)
    sign_in_as(user)
    click_button 'Sign out'
    expect(page). to have_content('goodbye!')
    expect(page).not_to have_content "logged in as: #{user.user_name}"
  end
end
