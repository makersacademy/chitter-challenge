require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see recent peeps in reverse order' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep,name,username) VALUES ('peep 1', 'bob', 'bobthebuilder123');")
    connection.exec("INSERT INTO peeps (peep,name,username) VALUES ('another peep', 'adam', '3gg');")
    connection.exec("INSERT INTO peeps (peep,name,username) VALUES ('last peep for now', 'sara', 'sarah123');")

    visit('/')
    expect(page).to have_content 'Recent Peeps'

    expect(page).to have_content 'Name: bob, Username: bobthebuilder123'
    expect(page).to have_content 'peep 1'

    expect(page).to have_content 'Name: adam, Username: 3gg'
    expect(page).to have_content 'another peep'

    expect(page).to have_content 'Name: sara, Username: sarah123'
    expect(page).to have_content 'last peep for now'
    
  end
end
