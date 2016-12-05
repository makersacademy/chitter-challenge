require 'spec_helper'



# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  include Helpers
  scenario "I want to sign up with email, password, name and username" do
    sign_up
    expect(page).to have_content "Welcome maker"
  end

  scenario "I want to check a new account has been created in the database" do
    expect{new_sign_up}.to change(User, :count).by(1)
  end

end
