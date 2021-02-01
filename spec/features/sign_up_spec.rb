feature 'Chitter registration' do
    scenario 'a user can sign up' do
        visit '/users/new'
        fill_in('email', with: 'test@chitter.com')
        fill_in('password', with: 'password')
        click_button 'Submit'
        expect(page).to have_content 'Welcome to Chitter, test@chitter.com!'
    end
end