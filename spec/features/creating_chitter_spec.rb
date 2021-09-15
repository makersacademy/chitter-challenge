feature 'Adding a new chitter' do
    scenario 'A user can add a chitter to chitter app' do
      visit('/chitter/new')
      fill_in('url', with: 'http://example.org')
      click_button('Submit')
  
      expect(page).to have_content 'http://example.org'
    end
  end

  