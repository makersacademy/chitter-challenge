require 'spec_helper'

#USER STORY 2
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User can log in' do

  scenario 'credentials are authenticated on log in' do
    sign_up
    log_in
    expect(page).to have_content "Welcome"
  end

  scenario 'cannot log in with wrong credentials' do
    sign_up
    log_in_wrong_password
    expect(page).not_to have_content "Welcome"
  end

end
