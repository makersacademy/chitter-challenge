require_relative 'web_helper'

feature 'can view messages posted to chitter' do
  scenario 'a user can view one peep' do
    Peeps.create(message: 'Test', user_id: 1)

    visit '/peeps'

    expect(page).to have_content 'Test'
  end

  scenario 'a user can view multiple peep' do
    Peeps.create(message: 'Test', user_id: 1)
    Peeps.create(message: 'Test2', user_id: 1)
    Peeps.create(message: 'Test3', user_id: 1)

    visit '/peeps'

    expect(page).to have_content 'Test'
    expect(page).to have_content 'Test2'
    expect(page).to have_content 'Test3'
  end

end
