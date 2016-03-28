# require 'web_helper'

feature 'User management' do
  include Helpers

  scenario 'User can sign up with name, username, email, password' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, ghost!')
    expect(User.first.username).to eq('ghost')
  end

  scenario 'mismatch of passwords' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  context 'email' do
    scenario 'entering no email will not update database' do
      expect do
         visit '/users/new'
         click_button 'Sign up'
       end.not_to change(User, :count)
      expect(page).to have_content('Email must not be blank')
    end

    scenario ' entering invalid email will not update database' do
      expect do
        visit '/users/new'
        fill_in 'email', with: 'johnsmithgmail.com'
        click_button 'Sign up'
      end.not_to change(User, :count)
      expect(page).to have_content('Email has an invalid format')
    end

    scenario 'user must have unique email address to sign up' do
      sign_up
      expect{ sign_up }.not_to change{ User.count }
      expect(page).to have_content('Email is already taken')
    end
  end
end
