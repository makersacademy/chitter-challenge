require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, xx1xx')
    expect(User.first.nickname).to eq 'xx1xx'
    expect(User.first.email).to eq('one@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(name: 'Anna',
              nickname: 'xx1xx',
              email: 'one@example.com',
              password: '1234',
              password_confirmation: '1234')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :nickname, with: nickname
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
