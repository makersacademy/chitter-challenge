RSpec.feature 'posting messages' do

    context ' a user is logged in' do 
        before {
            generic_signup
        }
        it 'displays the post message form if user is logged in' do 
            expect(page).to have_selector("input[name = message]")
        end
    end
end