require 'spec_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    user = build(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, @alice_chitter')
    expect(User.first.handle).to eq('@alice_chitter')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: "Wrong")
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'when no handle is entered' do
   user = build(:user, handle: "")
   expect { sign_up(user) }.not_to change(User, :count)
   expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
   expect(page).to have_content 'Handle must not be blank'
  end

  scenario 'With a handle that is already registered' do
    user = build(:user)
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Handle is already taken')
  end

  scenario 'when no email is entered' do
   user = build(:user, email: "")
   expect { sign_up(user) }.not_to change(User, :count)
   expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
   expect(page).to have_content 'Email must not be blank'
  end

  scenario 'With an email that is already registered' do
    user = build(:user)
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end
end
