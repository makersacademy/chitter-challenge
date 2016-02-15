require_relative '../app/models/user'

 describe User do
   subject(:user) { described_class }
   let(:email) { 'don123@gmail.com' }
   let(:password) { '123456' }
   let(:name) { 'Donald Trump' }
   let(:username) { 'don123' }

   it 'A user is authenticated against a given password' do
     user.create(email: email,
                 username: username,
                 name: name,
                 password: password,
                 password_confirmation: password)
     expect(user.authenticate(username, password)).to be true
   end
 end
