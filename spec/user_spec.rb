require 'bcrypt'

describe User do
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
    context 'given the correct password' do
      it 'returns true' do
        expect(user.authenticate("passhash")).to be true
      end
    end
  end
end