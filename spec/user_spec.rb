require 'bcrypt'

describe User do
  let(:user_password) { double(:user_password) }
  let(:user_password_class) { double(:user_password, find_by: user_password) }
  let(:bcrypt_class) { double(:bcrypt_class) }

  subject(:user) { 
    salt = BCrypt::Engine.generate_salt
    password = BCrypt::Engine.hash_secret("passhash", salt)
    User.create(name: "Guy", handle: 'guy') 
  }
  it 'knows its name' do
    expect(user.name).to eq "Guy"
  end

  it 'knows its handle' do
    expect(user.handle).to eq 'guy'
  end

  describe '#authenticate' do
    it 'forwards the authentication check to the UserPassword instance' do
      expect(user_password).to receive(:check).with("passhash")
      allow(user).to receive(:user_password_class) { user_password_class }
      user.authenticate("passhash")
    end
  end
end