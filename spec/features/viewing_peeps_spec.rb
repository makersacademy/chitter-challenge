feature 'VIEWING PEEPS' do
  feature 'visiting the homepage' do
    scenario 'visiting the index page' do
      visit '/'
      expect(page).to have_content "Chitter"
    end
  end

  feature 'viewing peeps' do
    scenario 'a user can see all peeps' do
      visit '/peeps'

      expect(page).to have_content "This is the first peep"
      expect(page).to have_content "This is the second peep"
      expect(page).to have_content "This is the third peep"
    end
  end
end