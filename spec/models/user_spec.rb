require './app/models/user'

describe User do

  let(:user) { user = create(:user) }

  describe '#authenticate' do
    it 'returns user if credentials are correct' do
      expect(User.authenticate(user.email, user.password)).to eq user
    end

    it 'returns nil when credentials are incorrect' do
      expect(User.authenticate(user.email, "wrong")).to be_nil
    end
  end
end
