require './spec/spec_helper'
require './spec/web_helper'

feature 'User sign up' do

  scenario 'User can visit sign up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    find_field('Email').value
    find_field('Password').value
    find_field('Confirm password').value
    find_field('Name').value
    find_field('User name').value
    expect(page).to have_button('Sign up')
  end

  scenario 'New user signs up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@email.com')
    expect(User.first.email).to eq('test@email.com')
  end

  scenario 'User fails password confirmation' do
    expect{ sign_up(password_confirmation: 'WrongPW') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'User cannot sign up without email' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'User cannot sign up with invalid email' do
    expect{ sign_up(email: "bob") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'User cannot sign up with existing email' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'User cannot sign up without name' do
    expect{ sign_up(name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'User cannot sign up without user name' do
    expect{ sign_up(user_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('User name must not be blank')
  end

  scenario 'User cannot sign up with existing user name' do
    sign_up
    expect{ sign_up(email: 'test2@email.com') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('User name is already taken')
  end

end

feature 'User signs in' do
  let!(:user) do
    User.create(email: 'test@email.com', name: 'tester', user_name: 'testmiester',
      password: 'password', password_confirmation: 'password')
  end

  scenario 'User can sign in with the correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'User cannot sign in with the wrong password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end

feature 'User signs out' do
  let!(:user) do
    User.create(email: 'test@email.com', name: 'tester', user_name: 'testmiester',
      password: 'password', password_confirmation: 'password')
  end

  scenario 'User can sign out' do
    sign_in(email: user.email, password: user.password)
    click_button('Sign out')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content "Signed out"
  end

end
