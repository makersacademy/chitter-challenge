feature 'log in' do
   let(:user) do
     User.create(email: 'joe_bloggs@gmail.com',
                 password: 'yo12345',
                 password_confirmation: 'yo12345')
   end

   scenario 'with correct credentials' do
     sign_in(email: user.email,   password: user.password)
     expect(page).to have_content "Welcome, #{user.email}"
   end
end
