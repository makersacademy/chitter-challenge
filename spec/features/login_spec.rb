require 'spec_helper'

describe 'user login process' do

  scenario 'user inputs details and can see username' do
    create_user
    sign_in
    expect(page).to have_content "the_ceo"
  end

  scenario 'user tries to login if not signed up' do
    sign_in
    expect(page).to have_content "Sorry, your details were not recognised"
  end

  scenario 'user tries to login with wrong password' do
    create_user
    sign_in_wrong_psswrd
    expect(page).to have_content "Sorry, you have submitted an incorrect password"
  end

  scenario 'user signs up, logs out and logs back in' do
    sign_up
    sign_out
    log_back_in
    expect(page).to have_content "the_ceo"
  end

end
