require 'spec_helper'

feature 'Signing up' do

  scenario 'there is an option to sign up on the home page' do
    visit '/homepage'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Sign up'
  end

end
