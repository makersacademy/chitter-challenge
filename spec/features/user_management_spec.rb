require_relative '../web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice241')
    expect(User.first.handle).to eq('alice241')
  end

  xscenario 'requires matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong password') }.not_to change(User, :count)
  end

  xscenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong password') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  xscenario 'I cant sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  xscenario 'I cant sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  xscenario 'I can not sign up with the same email twice' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
