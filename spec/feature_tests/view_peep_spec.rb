feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # connection.exec("INSERT INTO bookmarks VALUES(1, 'finn_the_human', 'Finn', 'Mathematical!');")

    visit '/peeps'

    expect(page).to have_content 'Mathematical!'
  end
end
