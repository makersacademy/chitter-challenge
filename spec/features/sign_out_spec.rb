feature 'Signing out' do
    scenario "your username is not longer visible once you've signed out" do
      
        visit('/')
        click_button('Sign In')

        fill_in('username', with: 'charliecodes')
        click_button('Sign In')
        expect(page).to have_content 'Hello charliecodes'

        click_button('Sign Out')
        click_button('Confirm')
        expect(page).to_not have_content 'Hello charliecodes'
    end
end
