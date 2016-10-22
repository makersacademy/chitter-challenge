require 'spec_helper'

describe 'user logout process' do

  before do
    User.create(name: "Malinna Leach", username: "the_ceo", email: "ceo@chitter.com", password: "s3cr3t")
  end

  scenario 'user logs out and won\'t see username' do
    sign_in
    sign_out
    expect(page).not_to have_content "the_ceo"
  end

  scenario 'user logs out and is greeted as a stranger' do
    sign_in
    sign_out
    expect(page).to have_content "Welcome stranger"
  end

end
