require 'pg'

feature 'Viewing homepage' do

  scenario 'visiting the index page' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now}', 'First peep');")
    connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now}', 'Second peep');")
    connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now}', 'Third peep');")

    visit('/')

    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
    expect(page).to have_content "Third peep"
  end

end
