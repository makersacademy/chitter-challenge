require 'spec_helper'
feature 'Visiting Homepage' do

  scenario 'I have the options to login or register' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Sign In')
  end
end
