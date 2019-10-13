feature 'sign up' do
    scenario 'user can create an account' do
        visit('/')
        click_link 'Sign up'
        fill_in 'email', with:'test@test.com'
        fill_in 'user_name', with:'test'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('Welcome to Chitter, test')
    end

    scenario 'gives error is username taken' do
        User.create(user_name:'test', email:'test@test.com', password:'test')
        visit('/')
        click_link 'Sign up'
        fill_in 'email', with:'test2@test.com'
        fill_in 'user_name', with:'test'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('Username taken')
        expect(page).not_to have_content('test')
    end

    scenario 'gives error is email is taken' do
        User.create(user_name:'test', email:'test@test.com', password:'test')
        visit('/')
        click_link 'Sign up'
        fill_in 'email', with:'test@test.com'
        fill_in 'user_name', with:'test2'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('email already in use')
        expect(page).not_to have_content('test')
    end
end