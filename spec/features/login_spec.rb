require 'spec_helper'

describe 'user login process' do
  
  scenario 'user inputs details and can see username' do
    User.create(name: "Malinna Leach", username: "the_ceo", email: "ceo@chitter.com", password: "s3cr3t")
    sign_in
    expect(page).to have_content "the_ceo"
  end

  scenario 'user tries to login if not signed up' do
    sign_in
    expect(page).to have_content "Sorry, your details were not recognised"
  end

end
