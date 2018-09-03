require './app'
require './web_helper'

feature 'when viewing the home page' do
  scenario 'the user can see peeps in reverse chronological order' do
    clear_test_database
    peep_twice
    visit '/'
    expect('second test peep').to appear_before('first test peep')
  end
end
