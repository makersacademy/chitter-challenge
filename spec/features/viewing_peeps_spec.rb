require 'spec_helper'
feature 'Viewing links' do

  scenario 'I can see existing peeps on the peeps page' do
    user = create(:user)
    sign_in(user)
    visit '/peeps'
    fill_in :message, with: 'Omg this is my first peep!'
    click_button 'Peep'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Omg this is my first peep!')
  end
end
