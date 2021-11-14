require 'spec_helper'

feature 'Creating peeps' do
  scenario 'can Peep! a message and it displays on the page' do
    visit('/peeps')
    fill_in('message', with: 'This is a test Peep')
    click_button('Peep!')
    expect(page).to have_content('This is a test Peep')
  end
end
