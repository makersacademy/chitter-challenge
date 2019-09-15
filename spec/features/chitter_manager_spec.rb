require_relative '../setup_test_database'
require 'timecop'

feature 'Create a new peep' do
  scenario 'Text and the time is shown on the screen' do

    truncate_table
    time_new = Time.new
    Timecop.freeze(time_new) do
      visit '/'
      click_button 'Create Peeps'
      fill_in 'text', with: 'This is my first peep'
      click_button 'submit'
      click_button 'View Peeps'
      expect(page).to have_content 'This is my first peep'
      expect(page).to have_content time_new
    end
  end
end