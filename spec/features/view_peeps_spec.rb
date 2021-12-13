feature 'Viewing peeps' do
    scenario 'can see all posted peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.post(username: "ruby123", message: "First peep")
      Peep.post(username: "javascript123", message: "Second peep")
      Peep.post(username: "sql123", message: "Third peep")

      visit('/peeps')
      expect(page).to have_content "First peep"
      expect(page).to have_content "Second peep"
      expect(page).to have_content "Third peep"
    end
  end
  