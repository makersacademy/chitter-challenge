require 'bcrypt'

describe User do
  let(:user_password) { double(:user_password) }
  let(:user_password_class) { double(:user_password, find_by: user_password) }
  let(:bcrypt_class) { double(:bcrypt_class) }

  subject(:user) { 
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

  describe '#tags' do
    context 'when user has been tagged' do
      it 'returns a list of tags' do
        new_user
        user = User.find_by(name: "Guy")
        new_user('Ben', 'ben', 'ben@mail.com')
        peep = Peep.create(content: '@guy tagged', user_id: user.id)
        Tag.check(peep)
        expect(user.tags[:unread].first).to be_a Tag
      end
    end
  end
end
