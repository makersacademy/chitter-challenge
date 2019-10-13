require 'bcrypt'

describe User do
  let(:user_password_class) { double(:user_password_class) }
  let(:bcrypt_class) { double(:bcrypt_class) }

  subject(:user) { 
    salt = BCrypt::Engine.generate_salt
    password = BCrypt::Engine.hash_secret("passhash", salt)
    User.create(name: "Guy", handle: 'guy', passhash: password, salt: salt) 
  }
  it 'knows its name' do
    expect(user.name).to eq "Guy"
  end

  it 'knows its handle' do
    expect(user.handle).to eq 'guy'
  end

  it 'knows its passhash' do
    expect(user.passhash).to be_a String
  end

  describe '#authenticate' do
    it 'forwards the authentication check to the UserPassword class' do
      allow(user).to receive(:user_password_class) { user_password_class }
      expect(user_password_class).to receive(:check).with(
        password: "passhash",
        salt: user.salt,
        passhash: user.passhash
      )
      user.authenticate("passhash")
    end
  end
end