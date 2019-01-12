require './lib/user.rb'

RSpec.describe 'User' do
let!(:user) { User.create(name: "Bob", username: "Bob1", email: "bob1@gmail.com", password: "1234") }

 describe 'authenticate' do

   it 'user and password exist' do
    expect(User.authenticate(user.email, "1234")).to eq user
   end

   it 'user doesnt exist' do
    expect(User.authenticate("james@gmail.com", "1234")).to eq nil
   end

   it 'user exists but password incorrect' do
    expect(User.authenticate(user.email, "5678")).to eq nil
   end
   
 end
end