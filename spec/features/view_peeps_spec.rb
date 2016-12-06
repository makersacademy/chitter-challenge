require 'spec_helper'

feature 'view peeps' do
  scenario 'user can see all peeps' do
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Peeps"
  end
end
