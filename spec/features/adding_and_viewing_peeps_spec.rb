feature 'Adding and viewing peeps' do
  feature 'a user can add and then view a peep' do
    scenario 'a peep has the name and username of the user' do
      log_in_with_test_user_1

      click_button('New Peep')
      fill_in('message', with: 'This is my peep')
      click_button('Submit')  

      expect(page).to have_content 'Test Name (@testuser1): This is my peep'
    end
  end
end
