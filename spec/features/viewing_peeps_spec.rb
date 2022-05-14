feature 'Viewing peeps' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
    
      expect(page).to have_content 'Chitter'
    end
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      Peep.create(body: 'my first peep')
      Peep.create(body: 'my second peep')
      Peep.create(body: 'my third peep')

      visit '/peeps'

      expect(page).to have_content 'my first peep'
      expect(page).to have_content 'my second peep'
      expect(page).to have_content 'my third peep'
      # expect(page).to have_content Time.now.strftime('%R')
    end
  end
end
