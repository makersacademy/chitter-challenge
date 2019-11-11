feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Log in to Chitter"
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      connection = PG.connect(dbname: 'chitter_board_test')

      # Add the test data:
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('UNTIL','Nelson Mandela','https://bit.ly/33ADu6u');")
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('Something very big','Donald J Trump','https://bit.ly/34MAALX');")
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('I am slow to learn','Abraham Lincoln','https://bit.ly/33AuU7P');")
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('The secret of life.','Fela Kuti','https://bit.ly/3717kmS');")

      visit('/peeps')
      expect(page).to have_content "UNTIL"
      expect(page).to have_content "Something very big"
      expect(page).to have_content "I am slow to learn"
      expect(page).to have_content "The secret of life"
    end
  end
end
