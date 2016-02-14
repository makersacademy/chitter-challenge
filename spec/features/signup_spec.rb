require 'spec_helper'

  def signup(email: 'sarah@sarah.com',
              password: 'lala!',
              password_confirmation: 'lala!')
      visit '/signup'
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'register'
  end

  feature 'sign up' do

    scenario 'I want to sign-up' do
      expect{signup}.to change(User, :count).by(1)
      # expect(page).to have_content('Welcome sarah@sarah.com')
      expect(User.first.email).to eq('sarah@sarah.com')
    end

    scenario 'passwords do not match' do
      expect {signup(password_confirmation: 'wrong')}.not_to change(User, :count)
      expect(page).to have_current_path('/signup')
      expect(page).to have_content('Password does not match the confirmation')
    end

    scenario 'user does not enter an email address' do
      expect{signup(email: nil)}.not_to change(User, :count)
      expect(page).to have_current_path('/signup')
      expect(page).to have_content('Email must not be blank')
    end

    scenario 'a user enters a genuine email address' do
      expect{signup(email: 'potatoe.com')}.not_to change(User, :count)
      expect(page).to have_current_path('/signup')
      expect(page).to have_content('Email has an invalid format')
    end

    scenario 'a user cannot sign up with an already registered email address' do
      signup
      expect{signup}.not_to change(User, :count)
      expect(page).to have_content('Email is already taken')
    end

  end
