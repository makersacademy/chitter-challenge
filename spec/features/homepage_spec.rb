require 'spec_helper'

feature 'Homepage' do
  scenario 'Visiting the homepage is possible' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome to Chitter!')
  end
end
