require_relative '../spec_helper'

feature 'signing up' do
  scenario 'a user can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Laszlo!')
  end
  scenario "a user can't sign up with missmatching passwords" do
    expect{ sign_up(password_confirmation: 'wrongpassword') }.to change(User, :count).by(0)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "a user can't sign up if a resuired information is missing" do
    expect{ sign_up(name: '', user_name: '', email: '') }.to change(User, :count).by(0)
    expect(page).to have_content('Name must not be blank User name must not be blank Email must not be blank')
  end

  scenario "a user can't sign up if the email has incorrect format" do
    visit '/'
    expect{ sign_up(email: 'incorrect@email') }.to change(User, :count).by(0)
    expect(page).to have_content('Email has an invalid format')
  end
  scenario "a user can't sign up if already has an account" do
    sign_up
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('User name is already taken Email is already taken')
  end
end
