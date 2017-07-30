require_relative 'web_helper'
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sully@example.com')
    expect(User.first.email).to eq('sully@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
end
