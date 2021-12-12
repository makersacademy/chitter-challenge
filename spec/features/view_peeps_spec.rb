feature 'Viewing peeps' do
    scenario 'can see all posted peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.post(message: "First peep")
      Peep.post(message: "Second peep")
      Peep.post(message: "Third peep")

      visit('/peeps')
      expect(page).to have_content "First peep"
      expect(page).to have_content "Second peep"
      expect(page).to have_content "Third peep"
    end
  end
  