require 'pg'

feature 'Viewing the page' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'

      expect(page).to have_content 'Welcome to Chitter'
    end
  end

  feature 'Viewing peeps' do
    scenario 'A user can see peeps in descending order' do
      Peep.create(text: 'This is a test')
      Peep.create(text: 'So is this')
      Peep.create(text: 'As is this')

      visit '/timeline'

      expect(page).to have_content('This is a test')
      expect(page).to have_content('So is this')
      expect(page).to have_content('As is this')
    end

    scenario 'It has the time on the peeps' do
      
    end
  end
end
