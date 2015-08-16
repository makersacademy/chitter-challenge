require 'spec_helper'
feature 'Visiting Homepage' do

  scenario 'I have the options to login or register' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Please Sign In')
    expect(page).to have_content('New User? Please Register')
  end
end
