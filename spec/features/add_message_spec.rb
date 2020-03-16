feature 'add a message' do
    scenario 'add a message' do
        visit('/')
        
        click_button('Register')
        fill_in('user_id', with: 'user1')
        fill_in('name', with: 'Bob')
        fill_in('email', with: 'bob@bob.bob')
        fill_in('password', with: 'bobspelledbackwardsisbob')
        click_button('Submit')

        click_button('New Message')
        fill_in('message', with: 'hello, this is a test')
        click_button('Chit on it!')

        expect(page).to have_content "hello, this is a test"
    end
end