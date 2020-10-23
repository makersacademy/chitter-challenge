require 'pg'

feature 'viewing messages on chitter' do
  # scenario 'view a test peep' do
  #   visit '/'
  #   expect(page).to have_content 'test peep'
  # end

  scenario 'viewing existing peeps from db' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'this is my first feature test peep using psql');")
    connection.exec("INSERT INTO peeps VALUES(2, 'my second psql peep');")
    visit '/'
    expect(page).to have_content "this is my first feature test peep using psql"
    expect(page).to have_content "my second psql peep"
  end
end
