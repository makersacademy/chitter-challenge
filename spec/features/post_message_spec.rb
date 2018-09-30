feature 'post message' do
    scenario 'submit and see message' do
      visit ('/')
      fill_in('name', with: 'Test name')
      fill_in('content', with: 'Test message')
      click_button('Submit')
      expect(page).to have_content('Test name')
      expect(page).to have_content('Test message')
  end
end
