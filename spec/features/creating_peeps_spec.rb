require 'chitter'
require 'pg'

feature '.create' do
  scenario 'creating a new peep' do
    visit('/peeps/new')
    fill_in 'text', with: "peep peep some text"
    click_button 'Peep'
    expect(page).to have_content("peep peep some text")
  end
end
