require 'spec_helper'

feature 'User sign up' do

  scenario 'User clicks Sign Up button to sign up as a new user' do
    visit '/peeps'
    click_button 'Sign Up'
    expect(page).to have_content 'Sign up as a new user'
  end

  scenario 'can sign up with name, username, email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, tadan!'
    expect(page).not_to have_button 'Sign Up'
    expect(page).not_to have_button 'Sign In'
  end

  scenario 'cant sign up when passswords do not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "data is saved in the form when passwords do not match" do
    sign_up(password_confirmation: 'wrong')
    expect(page).to have_field(:name, with: 'Tadas Majeris')
    expect(page).to have_field(:username, with: 'tadan')
    expect(page).to have_field(:email, with: 'tadas@gmail.com')
  end

  scenario "cant sign up with an empty email" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'cant sign up without a valid email'do
    expect { sign_up(email: 'a@a') }.not_to change(User, :count)
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'only one user per email' do
    sign_up
    expect { sign_up(username: 'tadeush') }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

  scenario 'cant sign up if given username already exists' do
    sign_up
    expect { sign_up(username: 'tadan', email: 'me@me.me') }.not_to change(User, :count)
    expect(page).to have_content "Username is already taken"
  end
end
