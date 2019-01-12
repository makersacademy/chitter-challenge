RSpec.feature 'signup ' do
    let(:dummy_email){ 'someone@somewhere.com' }
    let(:dummy_password) { 'password' }

    context 'user arrives on site to sign up' do 

        it 'sucessful sign up should take us back to main page with welcome message ' do 
            sign_up(dummy_email, dummy_password)
            expect(page).to have_content(dummy_email)
        end
    end
end