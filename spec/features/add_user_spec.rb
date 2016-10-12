require './spec/spec_helper'

feature 'User sign up' do
  scenario 'User can visit sign up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    find_field('Email').value
    find_field('Password').value
    expect(page).to have_button('Sign up')
  end

  scenario 'New user is created' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@email.com')
    expect(User.first.email).to eq('user@email.com')
  end

  scenario 'Fail password confirmation' do
    expect{ sign_up(password_confirmation: 'WrongPW') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'Cannot sign up without email' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'Cannot sign up with invalid email' do
    expect{ sign_up(email: "bob") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Cannot sign up with existing email' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

end
