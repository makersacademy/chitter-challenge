feature 'view peep creation details' do
  scenario 'it allows a user to see the time a peep was posted to Chitter' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peep VALUES(1, 'Raindrops on roses', '2018-11-23 13:36:47');")
    connection.exec("INSERT INTO peep VALUES(2, 'and');")
    connection.exec("INSERT INTO peep VALUES(3, 'whiskers on kittens');")

    visit('/chitter')
    expect(page).to have_content "Raindrops on roses"
    expect(page).to have_content "and"
    expect(page).to have_content "whiskers on kittens"
    expect(page).to have_content "2018-11-23 13:36:47"
  end
end
