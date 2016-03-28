require './app/models/user'

describe User do

  let(:user) do
    User.create(name: 'Test',
                username: 'Test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end


  describe '#authenticate' do

    it 'returns user if credentials are correct' do
      expect(User.authenticate(user.username, user.password)).to eq user
  end

    it 'returns nil when credentials are incorrect' do
      expect(User.authenticate(user.username, "wrong")).to be_nil
    end
  end

end
