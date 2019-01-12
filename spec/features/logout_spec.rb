RSpec.feature 'signin ' do

    it ' a sined in or signed up user should be able to log out' do
        generic_signup 
        click_link 'logout'
        expect(page).to have_content('Sign up') 
    end 
end