feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'

      expect(page).to have_content 'Chitter'
    end
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      visit '/peeps'

      expect(page).to have_content "I'm happy today"
      expect(page).to have_content "I'm sad today"
      expect(page).to have_content "I'm feeling fun"
    end
  end
