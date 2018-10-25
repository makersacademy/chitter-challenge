require 'user'

describe User do
  let(:user) { described_class.new("an@email.com", "Alfie", "runticle", "runrunrun", "runrunrun") }
  context "A user:" do
    it 'has a username' do
      expect(user.user).to eq "runticle"
    end
    it 'has a password' do
      expect(user.pass).to eq "runrunrun"
    end
    it 'has an email' do
      expect(user.email).to eq "an@email.com"
    end
    it 'has a name' do
      expect(user.name).to eq "Alfie"
    end
  end

end
