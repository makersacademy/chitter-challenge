feature 'Viewing chitter ' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'viewing other users peeps' do
  scenario 'see all peeps in reverse chitter_test' do
    connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('Tired');")
  connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('Hungry');")
  connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('lonely');")

    visit ('/')

    expect(page).to have_content "Tired"
    expect(page).to have_content "Hungry"
    expect(page).to have_content "lonely"
  end
end
