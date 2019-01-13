require_relative './web_helper'

RSpec.feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can signup' do
      sign_up
      expect(page).to have_content 'Welcome, Unicorn!'
    end
  end

  context 'Log in/out' do
    let!(:user) { User.create(email: 'test@test.com', password: 'secret123') }

    scenario 'A user can signin' do
      log_in
      expect(page).to have_content 'Welcome, Unicorn'
    end

    scenario 'A signed in user can log out' do
      log_in
      click_button 'Log out'
      expect(page.current_path).to eq '/'
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Log in'
    end
  end
end
