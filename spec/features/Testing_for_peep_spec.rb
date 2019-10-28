require 'spec_helper'
require './app'

feature 'Adding a peep' do
  scenario 'Does the message/peep get displayed on the site' do
    visit('/peeps/new')
    fill_in('peep', with: 'a message')
    click_button('Submit')
    expect(page).to have_content('a message')
  end
end
