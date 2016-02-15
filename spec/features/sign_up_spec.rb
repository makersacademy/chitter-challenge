require 'spec_helper'

feature 'user signing up' do

  scenario 'fills in form correctly' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Hello, mjcollins86")
  end

  scenario 'cannot sign up when the password confirmation is incorrect' do
    expect { sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
    expect(page).not_to have_content("Hello, mjcollins86")
    expect(page).to have_content('Password does not match the confirmation')
    expect(current_path).to eq('/signup')
  end

  scenario 'cannot sign up when a password is not entered' do
    expect { sign_up(password: nil, password_confirmation: nil) }.not_to change(User, :count)
    expect(page).not_to have_content("Hello, mjcollins86")
    expect(page).to have_content('Password must not be blank')
    expect(current_path).to eq('/signup')
  end

  scenario 'cannot sign up when email is not entered' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'cannot sign up when email format is invalid' do
    expect { sign_up(email: 'email') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'cannot sign up with an email that is already registered' do
    sign_up(username: 'different')
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
    expect(current_path).to eq('/signup')
  end

  scenario 'cannot sign up when a username is not entered' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'cannot sign up with a username that is already taken' do
    sign_up(email: 'different@email.com')
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
    expect(current_path).to eq('/signup')
  end

end
