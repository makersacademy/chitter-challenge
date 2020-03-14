feature "Viewing Peeps" do
  scenario "visiting the index page" do
    visit '/'
    expect(page).to have_content "Chitter"
  end

  scenario "shows peeps" do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES (1, 'this is a peep about a cat');")
    connection.exec("INSERT INTO peeps VALUES (2, 'the cat is soft and fluffy');")
    connection.exec("INSERT INTO peeps VALUES (3, 'and if you die, it will eat your face');")

    visit '/peeps'

    expect(page).to have_content "this is a peep about a cat"
    expect(page).to have_content "the cat is soft and fluffy"
    expect(page).to have_content "and if you die, it will eat your face"
  end
end
