require_relative 'web_helper'

feature 'can view messages posted to chitter' do
  scenario 'a user can view one peep' do
    test_peep

    visit '/peeps'

    expect(page).to have_content 'Test'
  end
end
