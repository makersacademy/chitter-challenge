feature 'chitter page' do
  scenario "show all the peeps" do
    connection = PG.connect(dbname: 'chitter_test')

   # Add the test data
    # connection.exec("INSERT INTO peeps VALUES(1,'Hello from Mars!',CURRENT_TIMESTAMP);")
    # connection.exec("INSERT INTO peeps VALUES(2,'Welcome to the Moon!', CURRENT_TIMESTAMP);")
    # connection.exec("INSERT INTO peeps VALUES(3,'Go to Earth! Much more fun there!', CURRENT_TIMESTAMP); ")
    Peep.create(peeps: 'Hello from Mars!', timestamp:Inputtime.timestamp)
    Peep.create(peeps: 'Welcome to the Moon!', timestamp:Inputtime.timestamp)
    Peep.create(peeps: 'Go to Earth! Much more fun there!', timestamp:Inputtime.timestamp)

  visit '/chitter'

    expect(page).to have_content('Hello from Mars!', Time.now)
    expect(page).to have_content('Welcome to the Moon!',Time.now)
    expect(page).to have_content('Go to Earth! Much more fun there!',Time.now)
  end
end
