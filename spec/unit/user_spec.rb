require 'user'

describe User do
  let!(:user) { create_user }

  describe '#authenticate' do
    it "returns false if user doesn't exist" do
      expect(User.authenticate('wrong@email.com', 'wrongpassword')).to eq nil
    end

    it "returns false if wrong password" do
      expect(User.authenticate('lol@makers.com', 'wrongpassword')).to eq nil
    end

    it 'returns the user if user exists and password is correct' do
      expect(User.authenticate('lol@makers.com', 'funny123')).to eq user
    end
  end
end
