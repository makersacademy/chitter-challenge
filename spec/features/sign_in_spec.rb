require 'spec_helper'

describe Chitter do

  feature 'Sign in user' do

    scenario 'When I type in my credentials on the home page, and hit the sign in button, I get signed in' do
      create_test_user
      visit("/")
      sign_in
      expect(page).to have_current_path("/feed/:current_user")
      expect(page).to have_content("You are logged in as test_first_name test_last_name")
    end

  end
end
