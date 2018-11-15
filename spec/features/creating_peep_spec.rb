require 'timecop'
require 'peep'

feature 'creating a peep' do
  scenario 'Users can post a message to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Some peep message')
    click_button('Submit')

    expect(page).to have_content("Some peep message")
  end
end
