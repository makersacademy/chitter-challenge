feature 'viewing a peep' do
  scenario 'a user can view a peep on chitter' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Happy Friday!');")
    
    visit '/chitter'

    expect(page).to have_content('Happy Friday!')
  end
end
