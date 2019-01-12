RSpec.feature 'signin ' do
  

    context 'user arrives on site to sign in' do 

        before {
            generic_signup
            logout_user
        }

        it 'sucessful sign up should take us back to main page with welcome message ' do 
            # jack is the default name from webhelper 
            sign_in
            expect(page).to have_content('welcome jack')
        end
    end
end