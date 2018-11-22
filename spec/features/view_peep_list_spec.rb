feature "User can view list of peeps" do
  scenario "Peep list page shows list of peeps" do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('Hello world!');")
    connection.exec("INSERT INTO peeps (content) VALUES ('New to peeps');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Peep show');")
    
    visit ('/peeps/peeps_list')

    expect(page).to have_content("Hello world!")
    expect(page).to have_content("New to peeps")
    expect(page).to have_content("Peep show")

  end
end
