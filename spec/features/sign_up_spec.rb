require './spec/test_helpers'

feature 'sign up' do 

    scenario 'You should be able to sign up to chitter' do
        sign_up_and_continue
        expect(page).to have_content "User: ddottyler"
    end

end