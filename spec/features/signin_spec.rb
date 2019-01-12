RSpec.feature 'signin ' do
    let(:dummy_email){ 'someone@somewhere.com' }
    let(:dummy_password) { 'password' }
    let(:dummy_username) { 'Ratchet' }
    let(:dummy_name) { 'furball' }
    let(:record){ User.create(name: dummy_name, email: dummy_email, username: dummy_username, password: dummy_password)}

    context 'user arrives on site to sign in' do 

        before {
            sign_in(dummy_email, dummy_password)
        }

        it 'sucessful sign up should take us back to main page with welcome message ' do 
            expect(page).to have_content(dummy_username)
        end
    end
end