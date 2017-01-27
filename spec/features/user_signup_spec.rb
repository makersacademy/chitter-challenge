feature 'User sign up' do
    scenario 'I can sign up as a new user' do
        expect { sign_up }.to change(User, :count).by(1)
        expect(page).to have_content('Hey there, mj!')
        expect(User.first.email).to eq('michael@jackson.com')
        expect(User.first.user_name).to eq('mj')
        expect(User.first.name).to eq('Michael Jackson')
    end
end

=begin
Future tests:
    requires a matching confirmation password
    
    I can't sign up without an email address
    
    I can't sign up with an invalid email address
    
    I can't sign up with an email address that already exists
    
    I can't sign up with a user name that already exists
=end