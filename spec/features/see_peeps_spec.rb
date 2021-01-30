require 'pg'

feature 'See peeps' do
  scenario 'Click to see peeps' do

    DatabaseConnection.query("INSERT INTO peeps (message) VALUES ('Peep 1');")
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES ('Peep 2');")
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES ('Peep 3');")

    visit('/')
    click_button 'See Peeps'

    expect(page).to have_content 'Peep 1'
    expect(page).to have_content 'Peep 2'
    expect(page).to have_content 'Peep 3'
  end
end
