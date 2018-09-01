feature 'can see all peeps' do
  scenario 'see all peep messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Hello');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Hey');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Hi');")
      
    visit '/peeps'

    expect(page).to have_content "Hello"
    expect(page).to have_content "Hi"
    expect(page).to have_content "Hey"

  end
end
