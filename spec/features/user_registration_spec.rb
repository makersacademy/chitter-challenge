feature 'registration' do
    scenario 'a user can sign up for an account' do

        visit '/signup'
        fill_in('username', with: 'myname')
        fill_in('email', with: 'test@example.com')
        fill_in('password', with: 'password123')
        click_button('Submit')
        save_and_open_page
        expect(page).to have_content 'welcome, @myname'

    end
end