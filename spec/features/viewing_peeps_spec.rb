require 'pg'

feature 'Viewing peeps' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'

      expect(page).to have_content 'Welcome to Chitter'
    end
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      Peep.create(peeps: "First peep")
      Peep.create(peeps: "Second peep")
      Peep.create(peeps: "Third peep")

      visit '/peeps'

      expect(page).to have_content "First peep"
      expect(page).to have_content "Second peep"
      expect(page).to have_content "Third peep"
    end
  end
end
