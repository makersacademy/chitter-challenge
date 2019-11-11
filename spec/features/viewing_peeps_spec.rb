feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Log in to Chitter"
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      connection = PG.connect(dbname: 'chitter_board_test')

      # Add the test data:
      Peep.create(title: "UNTIL")
      Peep.create(title: "Something very big")
      Peep.create(title: "I am slow to learn")
      Peep.create(title: "The secret of life.")

      visit('/peeps')
      expect(page).to have_content "UNTIL"
      expect(page).to have_content "Something very big"
      expect(page).to have_content "I am slow to learn"
      expect(page).to have_content "The secret of life"
    end
  end
end
