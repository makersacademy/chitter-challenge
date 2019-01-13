require './lib/user.rb'

RSpec.describe 'User' do
let!(:user) { User.create(name: "Bob", username: "Bob1", email: "bob1@gmail.com", password: "1234") }

 describe '#authenticate' do

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

 describe 'validation' do

  it "checks for duplicate email" do
    user = User.create(name: "Test1", username: "@Test1", email: "Test1@gmail.com", password: "5678")
    expect(user.valid?).to eq true
    expect(User.create(name: "Test2", username: "@Test2", email: "Test1@gmail.com", password: "5678").valid?).to eq false
  end

  it "checks for duplicate username" do
    user = User.create(name: "Test3", username: "@Test3", email: "Test3@gmail.com", password: "5678")
    expect(user.valid?).to eq true
    expect(User.create(name: "Test4", username: "@Test3", email: "Test4@gmail.com", password: "5678").valid?).to eq false
  end

 end
end