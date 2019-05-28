feature 'sign_up' do
    scenario 'can let users create an account' do
        visit('/register/new')
        fill_in 'username', with: 'ChrisP'
        fill_in 'password', with: 'qwerty123'
        fill_in 'name', with: 'Chris'
        fill_in 'email', with: 'chris.p@mail.com'
        click_button 'Register'

        expect(page).to have_content("Welcome to Chitter")
    end
end