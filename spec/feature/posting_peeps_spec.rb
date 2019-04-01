require 'pg'

feature 'Posting peeps' do
  scenario 'from the homepage' do

    visit('/')
    fill_in 'peep', with: "Hello, World!"
    click_button 'Peep'
    expect(page).to have_content("Hello, World!")
  end
end
