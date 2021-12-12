feature 'Viewing peeps' do
    scenario 'can see all posted peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES('First peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Second peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Third peep');")

      visit('/peeps')
      expect(page).to have_content "First peep"
      expect(page).to have_content "Second peep"
      expect(page).to have_content "Third peep"
    end
  end
  