require_relative '../web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice241')
    expect(User.first.handle).to eq('alice241')
  end

  scenario 'requires matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong password') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong password') }.not_to change(User, :count)
    expect(current_path).to eq('users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
