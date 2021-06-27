feature 'Adding and viewing peeps' do
  feature 'a user can add and then view a peep' do
    xscenario 'a peep has the name and username of the user' do
      # sign in? what user?
      visit('/peeps/new')
      fill_in('message', with: 'This is my peep')
      click_button('Submit')  

      expect(page).to have_content 'Test Name (@testuser): This is my peep'
    end
  end
end
