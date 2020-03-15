require 'pg'

feature 'user registration' do
    
    scenario 'register a new user' do
        
        connection = PG.connect(dbname: 'chitter_test')

        visit('/')
        click_button('Register')
        fill_in('user_id', with: 'user1')
        fill_in('name', with: 'Bob')
        fill_in('email', with: 'bob@bob.bob')
        fill_in('password', with: 'bobspelledbackwardsisbob')
        click_button('Submit')

        expect(page).to have_content "Hello Bob"

    end

end