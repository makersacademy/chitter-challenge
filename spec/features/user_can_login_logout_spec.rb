feature 'login/logout' do

    scenario 'user can login' do
        DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test');")
        visit('/')
        click_link 'Sign in'
        fill_in 'user_name', with:'test'
        fill_in 'password', with:'test'
        click_button 'Submit'
        expect(page).to have_content('Welcome to Chitter, test')
        expect(page).to have_content('Logout')
    end

    scenario 'gives error if user gives incorrect login details' do
        DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test');")
        visit('/')
        click_link 'Sign in'
        fill_in 'user_name', with:'test'
        fill_in 'password', with:'test2'
        click_button 'Submit'
        expect(page).not_to have_content('Welcome to Chitter, test')
        expect(page).to have_content('Incorrect details try again')
    end

    scenario 'user can logout' do
        user = User.create(user_name:'test', email:'test@test.com', password:'test')
        visit("/user/#{user.user_name}")
        click_link 'Logout'
        expect(page).not_to have_content('Welcome to Chitter, test')
        expect(page).to have_content('Sign in')
    end

end