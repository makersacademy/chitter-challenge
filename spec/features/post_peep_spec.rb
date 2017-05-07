require './spec/spec_helper'
require './spec/test_helpers'

feature 'post peep' do
  scenario 'user is able to add new peeps' do
    create_user_log_in
    peep = 'My first peep!'
    click_link 'Peep'
    fill_in 'peep', with: peep
    click_button 'Peep!'
    expect(page).to have_content peep
  end
end
