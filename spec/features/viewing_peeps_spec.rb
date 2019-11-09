feature 'Viewing Peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!!"
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Steak and eggs is the breakfast of champions!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Dwayne Johnson does it again....');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Steve Buscemi has an odd autograph');")
    connection.exec("INSERT INTO peeps VALUES(4, 'Set them free!');")

    visit('/peeps')

    expect(page).to have_content "Steak and eggs is the breakfast of champions!"
    expect(page).to have_content "Dwayne Johnson does it again...."
    expect(page).to have_content "Steve Buscemi has an odd autograph"
    expect(page).to have_content "Set them free!"
  end
end
