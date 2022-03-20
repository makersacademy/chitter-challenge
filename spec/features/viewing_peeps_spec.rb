feature 'viewing peeps' do
  feature 'visiting the home page' do
    scenario ' the page title is visible' do
      visit '/'

      expect(page).to have_content 'Here are the latest peeps!'
    end
  end

  feature 'viewing peeps' do
    scenario 'a user can see peeps' do
      Peep.post(peep: 'What a beautil day!')
      Peep.post(peep: 'Going for a run now')

      visit '/peeps'

      expect(page).to have_content 'What a beautil day!'
      expect(page).to have_content 'Going for a run now'
    end
  end
end
