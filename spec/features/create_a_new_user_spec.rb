feature 'Creating a new user' do
    scenario 'A user can create an account' do
        visit('/users/new')

        fill_in('name', with: 'Vince')
        fill_in('username', with: 'vince')
        fill_in('email', with: 'vince@gmail.com')
        fill_in('password', with: 'password456')
        click_button('Create Account')

        expect(page).to have_content('Vince')
    end
end