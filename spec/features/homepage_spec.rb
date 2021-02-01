require './spec/test_helpers'

feature 'homepage' do 

    scenario 'it should welcome users to Chitter' do 
        visit '/home'
        expect(page).to have_content "Welcome to Chitter"
    end

    scenario 'it should have a working add peep button when signed up' do 
        sign_up_and_continue
        expect(page).to have_button "Add Peep"
    end

    scenario 'it should have a working sign up button' do 
        visit '/home'
        expect(page).to have_button "Sign up"
    end

    scenario 'if user is logged in, it should say who the user is' do 
        sign_up_and_continue
        expect(page).to have_content "User: ddottyler"
    end

end
