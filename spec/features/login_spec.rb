feature 'Logging In' do
    scenario 'user can fill in a form to login into account' do
        user = User.create(
            display_name: 'Matt',
            username: 'mdwareing',
            email: 'contact@matthewwareing.com',
            password: 'test'
        )
        visit('/login')
        fill_in('email', with: 'contact@matthewwareing.com')
        fill_in('password', with: 'test')
        click_button('Submit')

        expect(page).to have_content("#{user.display_name}")
    end
    
    it 'a user sees error when email entered incorrectly' do
        User.create(
            display_name: 'Matt',
            username: 'mdwareing',
            email: 'contact@matthewwareing.com',
            password: 'test'
        )

        visit '/login'
        fill_in('email', with: 'wrongt@email.com')
        fill_in('password', with: 'test')
        click_button('Submit')

        expect(page).to have_content("Please check your email or password")
    end
    
    it 'a user sees error when password entered incorrectly' do
        User.create(
            display_name: 'Matt',
            username: 'mdwareing',
            email: 'contact@matthewwareing.com',
            password: 'test'
        )

        visit '/login'
        fill_in('email', with: 'contact@matthewwareing.com')
        fill_in('password', with: 'wrongpassword')
        click_button('Submit')

        expect(page).to have_content("Please check your email or password")
    end

end