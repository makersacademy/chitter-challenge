feature 'Viewing peeps' do
  feature 'visiting the homepage' do
    scenario 'As an user, I can see the homepage' do
      visit '/'

      expect(page).to have_content 'Welcome! Please, enjoy our Chitter app!'
    end
  end

  feature 'Viewing peeps' do
    before do
      visit '/peeps/new'
      fill_in :text, with: "This is a peep"
      click_button "Peep"
    end

    scenario 'As an user, I can see the peeps' do
      visit '/peeps'

      expect(page).to have_content 'This is a peep'
    end
  end
end
