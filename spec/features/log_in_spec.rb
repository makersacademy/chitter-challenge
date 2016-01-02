feature 'log in' do
   let(:user) do
     User.create(name: 'Joe Bloggs',
                  username: 'bloggzy15',
                  email: 'joe_bloggs@gmail.com',
                  password: 'yo12345',
                  password_confirmation: 'yo12345')
   end

   scenario 'with correct credentials' do
     sign_in(email: user.email,   password: user.password)
     expect(page).to have_content "Welcome, #{user.username}"
   end
end
