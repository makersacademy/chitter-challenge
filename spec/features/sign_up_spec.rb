require 'spec_helper'

feature 'registering users' do

  scenario 'sign up a user' do
    expect { sign_up }.to change(User, :count).by(1)
    new_user = User.first
    expect(new_user.email).to eq('dennis@themenace.ha')
    expect(page).to have_content 'Welcome, Dennis'
  end

  scenario 'no new users created unless password confirmed' do
    expect{ sign_up(password_confirmation: 'wrong') }.to_not change(User, :count)
    expect(page).to have_content('Password and confirmation password do not match')
    expect(page).to have_field('name', with: 'Dennis The Menace')
    expect(page).to have_field('username', with: '@DennisDaMennace')
    expect(page).to have_field('email', with: 'dennis@themenace.ha')
  end

  scenario 'user must enter a valid email to sign up' do
    expect{ sign_up(email: nil) }.to_not change(User, :count)
    expect(page).to have_content('Please enter your email address')
    expect{ sign_up(email: 'invalid@email') }.to_not change(User, :count)
    expect{ sign_up(email: 'invalidemail.com') }.to_not change(User, :count)
  end

  scenario 'user cannot register with the same email more than once' do
    expect{ 2.times do sign_up end}.to change(User, :count).by 1
    expect(page).to have_content('This email address is already in use')
  end

  scenario 'user cannot register with the same username as somebody else' do
    sign_up
    log_out
    sign_up(email: 'different@email.com')
    expect(page).to have_content('This username is already taken')
  end


end
