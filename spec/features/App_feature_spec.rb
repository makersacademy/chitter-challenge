require 'pg'

feature 'viewing peeps' do
  scenario 'it displays test text' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO all_peeps (peep_text) VALUES('My first peep');")
    connection.exec("INSERT INTO all_peeps (peep_text) VALUES('My second peep');")

    visit('/peeps')

    expect(page).to have_content("My first peep")
    expect(page).to have_content("My second peep")
  end
end

feature 'Adding a new peep' do
  scenario 'A user can post a peep' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO all_peeps (peep_text) VALUES('This is a peep');")

    visit('/peeps/new')

    fill_in('new_peep', with: 'This is a peep')
    click_button('Submit')
    expect(page).to have_content 'This is a peep'
  end
end
