require 'pg'

feature 'Viewing peeps' do
  scenario 'viewing a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES('First Peep');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Second Peep');")

    visit '/'
    click_button 'View Peeps'
    visit '/peeps'

    expect(page).to have_content "First Peep"
    expect(page).to have_content "Second Peep"
  end
end
