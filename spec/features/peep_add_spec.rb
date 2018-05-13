require './spec/features/web_helper'

feature Chitter do
  scenario 'add a peep' do
    visit('/')
    fill_in 'peep', with: 'Be yourself; everyone else is already taken.'
    click_button 'Add Peep'
    expect(page).to have_content('Be yourself; everyone else is already taken.')
  end
end
