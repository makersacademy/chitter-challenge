feature 'Sign up a user' do
    scenario 'sign up a user from the form in signup page' do
        visit('/')
        click_link('Click to signup')
        fill_in('username', with: 'Johnny')
        fill_in('email', with: 'test@test.com')
        fill_in('password', with: 'hello123')
        click_button('Submit')
        expect(page).to have_content('You are signed in as Johnny')
    end
end