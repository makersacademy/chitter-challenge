feature 'Viewing peep' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page).to have_content 'Hello Peep'
    end
  end
end
