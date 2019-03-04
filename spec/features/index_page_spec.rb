require 'pg'
feature 'Viewing the login page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter!"
  end
end

 feature "viwing the peeps in /peeps route" do
   scenario "shows the list of peeps" do

    connection = PG.connect(dbname: 'chitterweb_test')

    connection.exec("INSERT INTO peeps (pmessage) VALUES('Hello');")
    connection.exec("INSERT INTO peeps (pmessage) VALUES('How are you?');")
    connection.exec("INSERT INTO peeps (pmessage) VALUES('What are you doing?');")
     # Peep.create(pmessage: "Hello")
     # Peep.create(pmessage: "How are you?")
     # Peep.create(pmessage: "What are you doing")

    visit('/peeps')
    expect(page).to have_content "Hello"
    expect(page).to have_content "How are you?"
    expect(page).to have_content "What are you doing?"
  end
end
