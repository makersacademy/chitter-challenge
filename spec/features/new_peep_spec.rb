feature 'posting a peep' do
  scenario 'a user can post a peep to chitter' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Happy Friday!');")
    
    visit '/chitter'

    expect(page).to have_content('Happy Friday!')
  end
end
