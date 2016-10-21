require 'spec_helper'

describe 'user sign up process' do
  scenario 'user inputs details and can see username' do
    sign_up
    expect(page).to have_content "the_guvnor"
  end
  scenario 'user inputs details and is saved to the database' do
    sign_up
    expect(User.first.name).to eq "Malinna Leach"
  end
end
