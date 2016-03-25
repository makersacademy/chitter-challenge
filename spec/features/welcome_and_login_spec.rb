require_relative 'web_helper'

feature 'signup route and process' do

  feature 'signup screen' do

    before :each do
      visit '/'
    end

      # scenario 'root redirect to signup route' do
      #   expect(current_path).to eq '/signup'
      # end

    scenario 'signup route has a welcome message' do
      expect(page).to have_content 'Welcome to the login page.'
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

    before :each do
      visit '/'
      register_to_site
    end

    scenario 'successful signup leads to the peeps page' do
      
    end

    scenario 'successful signup add a user entry in the database' do

    end

    xfeature 'signup validation: TODO wrong form etc' do

    end

  end


end
