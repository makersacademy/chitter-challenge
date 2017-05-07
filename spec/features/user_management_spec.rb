require_relative 'web_helper'

feature 'Signing up' do
  scenario 'I can sign up for an account' do
    expect { sign_up }. to change(User, :count).by(1)
    expect(page).to have_content('Welcome, izzy@example.com')
    expect(User.first.email).to eq('izzy@example.com')
  end

  scenario 'I cannot sign up with existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I need to enter a matching confirmation password' do
    expect { sign_up_confirmation(password_confirmation: 'no') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up_confirmation(password_confirmation: 'no') }.not_to change(User, :count)
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content 'Password does not match the confirmation'
  end
end

feature 'Signing in' do
  let!(:user) do
    User.new(email: 'izzy@example.com',
    password: 'password1')
  end
  scenario 'login with right info' do
    sign_up
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end

  feature 'Signing out' do
    let!(:user) do
      User.new(email: 'izzy@example.com',
      password: 'password1')
    end

    scenario 'I can log out if signed in' do
      sign_in(email: user.email, password: user.password)
      click_button 'Sign out'
      expect(page).to have_content('See you soon!')
      expect(page).not_to have_content('Welcome, izzy@example.com')
    end
  end

feature 'Resetting password' do
    scenario 'I can reset a forgotten password' do
      visit '/sign-in'
      click_link 'Forgotten password?'
      expect(page).to have_content("Please enter your email address")
    end

    scenario 'When I enter my email I am told to check my inbox' do
      recover_password
      expect(page).to have_content "Thanks, please check your inbox."
    end

    scenario 'assigned a reset token to the user when they recover' do
    sign_up
    expect{ recover_password }.to change{ User.first.password_token }
  end
  end
