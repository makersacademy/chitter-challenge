require 'user'

describe User do
  let!(:user) { User.create(email: 'test@test.com',
                username: 'Test',
                password: 'secret123')
  }

  let!(:user2) { User.create(
                 email: 'test@test.com',
                 username: 'Test2',
                 password: 'secret123')
  }

  context '#self.authenticate' do
    it 'rejects non-existent user' do
      expect(User.authenticate('jest@jest.com', 'secret123')).to eq nil
    end

    it 'rejects incorrect password, user exists' do
      expect(User.authenticate('test@test.com', 'jest456')).to eq nil
    end
  end

  it 'accepts correct password, user exists' do
    expect(User.authenticate('test@test.com', 'secret123')).to eq user
  end

  context '#valid?' do
    it 'ensures user email exists' do
      expect(user.valid?).to eq true
    end

    it "does not allow non-unique email address" do
      expect(user2.valid?).to eq false
    end
  end

  describe '#content' do
    it 'returns the peep content' do
      expect(user.username).to eq 'Test'
    end
  end
end
