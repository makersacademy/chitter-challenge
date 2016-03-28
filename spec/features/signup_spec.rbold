require_relative 'web_helper'

feature 'signup route and process' do

  feature 'signup screen' do

    before :each do
      visit '/signup'
    end

    scenario 'signup route has a welcome message' do
      expect(page).to have_content 'Welcome to the registration page.'
    end

    scenario 'signup route has a username field' do
      expect(page).to have_field 'username'
    end

    scenario 'signup route has a password field' do
      expect(page).to have_field 'password'
    end

    scenario 'signup route has a confirm password field' do
      expect(page).to have_field 'confirm'
    end

    scenario 'signup route has a email field' do
      expect(page).to have_field 'email'
    end

    scenario 'signup route has a register button' do
      expect(page).to have_button 'register'
    end

  end


  feature 'signup process' do

    scenario 'successful signup leads to the peeps page' do
      register_to_site
      expect(current_path).to eq '/peeps'
    end

    scenario 'successful signup add a user entry in the database' do
      expect{register_to_site}.to change(User, :count).by 1
    end

    scenario 'successful signup automatically logs in as the new user' do
      register_to_site
      expect(page).to have_content "you're signed in as test_user"
    end

    feature 'signup validation: TODO wrong form etc' do

      xscenario 'all validation' do

      end

    end

  end


end
