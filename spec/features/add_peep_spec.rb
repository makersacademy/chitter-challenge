require './app'
require './spec/database_helpers'
# require './spec/setup_test_database'

ENV['ENVIRONMENT'] = 'test'

feature 'adding a peep' do
  scenario 'adds a peep ' do
    # visit('/')
    # fill_in 'peep_text', with: 'This is my first peep from the screen'
    # click_button 'Add Peep'
    # expect(page).to have_content('Success')
  end
end
