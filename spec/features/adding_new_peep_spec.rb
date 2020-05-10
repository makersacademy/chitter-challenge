require 'spec_helper'

feature 'Adding new peep' do
  scenario 'user can add new peep' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky')
    page.set_rack_session(username: 'ricky')

    visit '/peeps'
    click_on('Add new peep')
    fill_in('content', with: 'Test')
    click_on('Submit')

    expect(page).to have_content 'Test'
    expect(page).to have_content 'ricky'

  end
end
