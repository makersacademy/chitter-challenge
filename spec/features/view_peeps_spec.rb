feature 'Viewing peeps' do
    scenario 'can see all posted peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (name,message) VALUES('ruby123', 'First peep');")
      connection.exec("INSERT INTO peeps (name,message) VALUES('javascript123', 'Second peep');")
      connection.exec("INSERT INTO peeps (name,message) VALUES('sql123', 'Third peep');")

      visit('/peeps')
      expect(page).to have_content "First peep"
      expect(page).to have_content "Second peep"
      expect(page).to have_content "Third peep"
    end
  end
  