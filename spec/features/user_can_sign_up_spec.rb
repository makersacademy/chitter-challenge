feature 'sign up' do
    scenario 'user can create an account' do
        visit('/')
        click_link 'Sign up'
        fill_in 'email', with:'test@test.com'
        fill_in 'user_name', with:'test'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('welcome test')
    end
end