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

  scenario "Peep list page will show timestamps of peeps" do

    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (content, timestamp) VALUES ('1st on list', '2018-11-22 10:40:31');")
    connection.exec("INSERT INTO peeps (content, timestamp) VALUES ('2nd on list', '2018-11-23 09:40:31');")
    connection.exec("INSERT INTO peeps (content, timestamp) VALUES ('3rd on list', '2018-11-23 10:40:31');")

    visit ('/peeps/peeps_list')

    expect(page).to have_content('2018-11-22 10:40:31')
    expect(page).to have_content('2018-11-23 09:40:31')
    expect(page).to have_content('2018-11-23 10:40:31')
  end

end
