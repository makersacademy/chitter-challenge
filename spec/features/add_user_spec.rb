require './spec/spec_helper'

feature 'User sign up' do
  scenario 'User can visit sign up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    find_field('Username').value
    find_field('Password').value
    expect(page).to have_button('Sign up')
  end

  scenario 'New user is created' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user100')
    expect(User.first.username).to eq('user100')
  end

  scenario 'it requires password confirmation' do
    expect{ sign_up(password_confirmation: 'WrongPW') }.not_to change(User, :count)
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario "I can't sign up without full name" do
    sign_up(full_name: nil)
    expect(page).to have_content("Full name must not be blank")
  end

  scenario "I can't sign up without a username" do
    sign_up(username: nil)
    expect(page).to have_content("Username must not be blank")
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'it raises an error if password does not match' do
    expect { sign_up(password_confirmation: 'wrongPW') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
