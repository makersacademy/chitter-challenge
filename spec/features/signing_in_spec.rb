require 'spec_helper'
require_relative 'web_helpers'

feature 'signing in' do

  let!(:user) do
    User.create(name: 'Santa',
                username: 'santaclaus',
                email: 'santa@northpole',
                password: 'christmas',
                password_confirmation: 'christmas')
  end

  scenario 'registered users can sign in' do
    sign_in('santaclaus', 'christmas')
    expect(page).to have_content("Signed in as santaclaus")
  end

  scenario 'user cannot sign in without correct password' do

    p "sign in"
    p user.username
   sign_in('santaclaus', 'rudolph')
   expect(page).to_not have_content("Signed in as santaclaus")
   expect(page).to have_content("The username or password is incorrect")
  end

end
