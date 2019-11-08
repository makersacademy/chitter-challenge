require 'pg'

feature 'Chitter' do 
    scenario 'Redirects to login from index view' do 
        visit('/')
        expect(page).to have_content "Log in"
    end

    scenario 'Log in user' do
        User.create('rob@rob.com', "rob")
        visit('/login')
        fill_in('email', :with => "rob@rob.com")
        fill_in('password', with: 'rob')
        click_button "Log in"
        expect(page).to have_content "rob@rob.com"
    end

    scenario 'Log in fails with invalid user' do
        User.create('rob@rob.com', "rob")
        visit('/login')
        fill_in('email', :with => "rob@rob.com")
        fill_in('password', with: 'ronjeremy')
        click_button "Log in"
        expect(page).to have_content "Log in"
    end

    scenario 'Sign up sucessfully' do 
        visit('/signup')
        fill_in('email', :with => "rob@rob.com")
        fill_in('password', with: 'rob')
        click_button "Sign up"
        expect(page).to have_content "You have successfully signed up!"
    end

    scenario 'Create post' do 
        log_in
        fill_in('text', :with => "This is my friday challenge")
        click_button "Post"
        expect(page).to have_content "This is my friday challenge"
    end
end


def log_in
    User.create('rob@rob.com', "rob")
    visit('/login')
    fill_in('email', :with => "rob@rob.com")
    fill_in('password', with: 'rob')
    click_button "Log in"
end