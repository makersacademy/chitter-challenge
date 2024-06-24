require 'pg'

feature 'Adding chits' do 
  scenario 'Add a new chit' do
    connection = PG.connect(dbname: 'chitter')
    visit('/chitter')
    fill_in :add_chitter_name, with: "@deanlewis"
    fill_in :add_chitter_chit, with: "My first chit!"
    click_button("Post")
    expect(page).to have_content "My first chit!"
  end
end
