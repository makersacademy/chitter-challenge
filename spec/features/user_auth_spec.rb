require './lib/message'
require './lib/user'
require 'capybara/rspec'
require './spec/web_helper'

RSpec.feature 'User Authentication' do
  context '4. Sign Up.' do
    scenario 'A user can signup' do
      signup_steps
      expect(page).to have_content 'Email: Password:'
    end
  end

  context '5. Sign In.' do
    scenario 'A user can log in to Chitter' do
      signin_steps
      expect(page).to have_content 'Welcome @test. Start Peeping!'
    end
  end

  context '6. Log Out.' do
    scenario 'A user can log out of Chitter' do
      signin_steps
      click_button 'Log out'
      expect(page.current_path).to eq "/"
    end
  end




end