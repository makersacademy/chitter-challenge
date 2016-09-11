require 'spec_helper'

feature 'User sign in' do

  scenario 'an existing user signs in' do
    sign_up_correct_password
    sign_in
    expect(page).to have_content("Welcome, matt@matt.com")
  end
end
