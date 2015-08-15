require 'spec_helper'

feature 'Signing up' do
  scenario 'I can sign up as a new user' do
    visit '/'
    click_button 'Sign up'
    user = build(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome #{user.username}"
    expect(User.first.email).to eq('rebecca@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:wrong_password_user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'no email entered' do
    user = build(:no_email_user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'no username entered' do
    user = build(:no_username_user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'I cannot sign up with an existing email' do
    user = create(:user)
    expect{ sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'I cannot sign up with an existing username' do
    user = create(:user)
    expect{ sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username is already taken'
  end
end