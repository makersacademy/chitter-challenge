feature 'Signing up' do
    scenario 'user can fill in a form to create an account' do
        visit('/signup')
        fill_in('display_name', with: 'Matt')
        fill_in('username', with: 'mdwareing')
        fill_in('email', with: 'contact@matthewwareing.com')
        fill_in('password', with: 'test')
        fill_in('confirm_password', with: 'test')
        click_button('Submit')

        expect(page).to have_content("Matt")
    end
end