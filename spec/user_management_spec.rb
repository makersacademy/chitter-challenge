require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, shogun!')
    expect(User.first.email).to eq('shogun@katana.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'cannot sign up without email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up with an existing user name' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('User name is already taken')
  end

  def sign_up(name: 'Musashi',
              user_name: 'shogun',
              email: 'shogun@katana.com',
              password: 'harakiri!',
              password_confirmation: 'harakiri!')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end