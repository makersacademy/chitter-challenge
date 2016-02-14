require 'spec_helper'

  def signup
    # (email: 'sarah@sarah.com',
    #           password: 'lala!',
    #           password_confirmation: 'lala!')
      visit '/signup'
      fill_in :email, with: 'sarah@sarah.com'
      fill_in :password, with: 'lala!'
      fill_in :password_confirmation, with: 'lala!'
      click_button 'register'
  end

  feature 'sign up' do

    scenario 'I want to sign-up' do
      expect{signup}.to change(User, :count).by(1)
      # expect(page).to have_content('Welcome sarah@sarah.com')
      # expect(User.first.email).to eq('sarah@sarah.com')
    end

  end
