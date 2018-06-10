feature 'Logging out' do
    it 'a user can sign out' do
        user = User.create(
            display_name: 'Matt',
            username: 'mdwareing',
            email: 'contact@matthewwareing.com',
            password: 'test'
        )

        visit '/login'
        fill_in('email', with: 'contact@matthewwareing.com')
        fill_in('password', with: 'test')
        click_button('Submit')

        click_button('Sign out')

        expect(page).to have_content 'Log back in soon!'
    end
end