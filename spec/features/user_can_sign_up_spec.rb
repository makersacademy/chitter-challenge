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
        DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test');")
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
        DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test');")
        visit('/')
        click_link 'Sign up'
        fill_in 'email', with:'test@test.com'
        fill_in 'user_name', with:'test2'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('Email already in use')
        expect(page).not_to have_content('test')
    end

    scenario 'gives error if field is left blank' do
        visit('/')
        click_link 'Sign up'
        fill_in 'email', with:''
        fill_in 'user_name', with:'test2'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('Fill in all fields')
        expect(page).not_to have_content('test')
    end

end