require 'spec_helper'

describe 'user sign up process' do

  scenario 'user inputs details and can see username' do
    sign_up
    expect(page).to have_content "the_ceo"
  end

  scenario 'user inputs details and is saved to the database' do
    sign_up
    expect(User.first.name).to eq "Malinna Leach"
  end

  scenario 'user tries to sign up twice with the same email' do
    sign_up
    sign_out
    sign_up
    expect(page).to have_content "Sorry, this email address is already signed up"
  end

  scenario 'user tries to sign up with a username that\'s been taken' do
    sign_up
    sign_out
    sign_up_diff_email
    expect(page).to have_content "Sorry, the username \"the_ceo\" has already been taken"
  end
end
