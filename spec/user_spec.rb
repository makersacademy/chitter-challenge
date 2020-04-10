require './lib/user'
describe User do
  context "signing up: " do
    it " should be able to create a new user with email address, username & password" do
    expect { User.new(name: 'eddoddo', pw: 'Secure_PW', email:'example@examples.com') }.not_to raise_error
    end
    it " should be able to tell me the details of the user" do
      eddo = User.new(name: 'eddoddo', pw: 'Secure_PW', email:'example@examples.com')
      expect(eddo.username).to eq('eddoddo')
      expect(eddo.password).to eq('Secure_PW')
      expect(eddo.email_address).to eq('example@examples.com')
    end
  end

  context "databasics: " do
  end
end