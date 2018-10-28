require 'tagger'
require 'user'

describe Tagger do
  describe '.tag' do
    it 'turns @user into link to profile' do
      User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
      message = 'Tagging @user1'
      expect(Tagger.tag(message)).to eq "Tagging <a href='/users/user1'>@user1</a>"
    end
  end
end
