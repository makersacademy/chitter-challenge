require 'pg'

feature 'Seeing peeps' do
  scenario 'on the feed page' do
    visit('/')
    fill_in 'peep', with: "Hello, World!"
    click_button 'Peep'
    visit('/')
    fill_in 'peep', with: "My second peep"
    click_button 'Peep'
    expect(page).to have_content("Chitter feed\nMy second peep")
  end
end
