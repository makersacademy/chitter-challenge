require 'pg'

feature 'viewing peeps in reverse chronological order' do
  scenario 'user can see a list of peeps, visits the index page' do
    connection = PG.connect(dbname: 'chitter_challenge_test')
    
    connection.exec("INSERT INTO chitter VALUES(1, 'Peep 1');")
    connection.exec("INSERT INTO chitter VALUES(2, 'Peep 2');")
    connection.exec("INSERT INTO chitter VALUES(3, 'Peep 3');")

    visit('/chitter')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end
end

  # As a maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order

  