require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peep VALUES(1, 'Raindrops on roses');")
    connection.exec("INSERT INTO peep VALUES(2, 'and');")
    connection.exec("INSERT INTO peep VALUES(3, 'whiskers on kittens');")

    visit('/chitter')

    expect(page).to have_content "Raindrops on roses"
    expect(page).to have_content "and"
    expect(page).to have_content "whiskers on kittens"
  end
end
