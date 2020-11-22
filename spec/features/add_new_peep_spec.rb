feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chitter_peeps (peeps) VALUES ('Hi everyone!');")
   
    visit '/chitterapp'

    expect(page).to have_content "Hi everyone!"
  end
end

