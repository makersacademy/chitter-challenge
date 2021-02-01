feature 'Signing out' do 
  scenario "your username is not longer visible" do 
      visit('/')
      click_button('Sign In')
      fill_in('username', with: 'dude')
      click_button('Sign In')
      expect(page).to have_content 'Hello dude'

      click_button('Sign Out')
      click_button('Confirm')
      expect(page).to_not have_content 'Hello dude'
  end 
end