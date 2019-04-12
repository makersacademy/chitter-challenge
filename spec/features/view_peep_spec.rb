require_relative 'web_helper'

feature 'can view messages posted to chitter' do
  scenario 'a user can view one peep' do
    Peeps.create(message: 'Test')

    visit '/peeps'

    expect(page).to have_content 'Test'
  end

  scenario 'a user can view multiple peep' do
    Peeps.create(message: 'Test')
    Peeps.create(message: 'Test2')
    Peeps.create(message: 'Test3')

    visit '/peeps'

    expect(page).to have_content 'Test'
    expect(page).to have_content 'Test2'
    expect(page).to have_content 'Test3'
  end

end
