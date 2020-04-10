require './lib/user'
describe User do
  context "signing up: " do
    it " should be able to create a new user with email address, username & password" do
    expect { User.new(name: 'eddoddo', pw: 'Secure_PW', email:'edd0ddi0@gmail.com') }.not_to raise_error
    end
  end
end