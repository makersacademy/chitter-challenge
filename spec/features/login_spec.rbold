require_relative 'web_helper'

feature 'login route and process' do

  feature 'login screen' do

    before :each do
      visit '/peeps'
    end

    feature 'main page has a login form when not logged in' do

      scenario 'signup route has a username field' do
        expect(page).to have_field 'username'
      end

      scenario 'signup route has a password field' do
        expect(page).to have_field 'password'
      end

      scenario 'signup route has a login button' do
        expect(page).to have_button 'login'
      end

    end

    scenario 'main page has no login form when logged in' do
      register_to_site
      expect(page).not_to have_button 'login'
    end

  end

end
