feature 'Adding a new peep' do
  scenario 'a user can add a peep onto chitter' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Breaking peep!!');")

    visit '/chitter'
  
    expect(page).to have_content('Breaking peep!!')
  end
end
