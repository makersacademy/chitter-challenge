feature 'Posting peep' do
  scenario 'User can add peep to chitter' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(170));")
    connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 1');")
    connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 2');")
    visit('/')
    click_button 'Add peep'
    fill_in 'peep', with: 'This is Peep 1'
    click_button 'Post'
    expect(page).to have_content 'This is Peep 1'
  end
end
