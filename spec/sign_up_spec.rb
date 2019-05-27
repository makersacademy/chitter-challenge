describe 'sign_up' do
    it 'can let users create an account' do
        visit('/')
        click_button 'Register'
        fill_in 'username', with: 'ChrisP'
        fill_in 'password', with: 'qwerty123'
        fill_in 'name', with: 'Chris'
        fill_in 'email', with: 'chris.p@gmail.com'

        expect(page).to have_content("Welcome to Chitter!")
    end
end