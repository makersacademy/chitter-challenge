require 'pg'

feature 'Chitter' do 
    scenario 'Redirects to login from index view' do 
        visit('/')
        expect(page).to have_content "Log in"
    end
end