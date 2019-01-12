RSpec.feature 'signup ' do
    let(:dummy_email){ 'someone@somewhere.com' }
    let(:dummy_password) { 'password' }
    let(:dummy_username) { 'Ratchet' }
    let(:dummy_name) { 'furball' }

    context 'user arrives on site to sign up' do 

        before {
            start_sign_up
            sign_up_name(dummy_name)
            sign_up_username(dummy_username)
            sign_up_email(dummy_email)
            sign_up_password(dummy_password)
            submit_sign_up
        }

        it 'sucessful sign up should take us back to main page with welcome message ' do 
            expect(page).to have_content(dummy_username)
        end
    end
end