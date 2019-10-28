feature 'can add a new user to the database' do
    scenario 'adding a new user' do
        visit('/')
        fill_in('username', with: "James123")
        fill_in('name', with: "James Bingham")
        fill_in('email', with: "james_bingham@live.co.uk")
        fill_in('password', with: "lol4321")

        # visit('/userlist')
        # expect(page).to have_content("James123")
    end
end