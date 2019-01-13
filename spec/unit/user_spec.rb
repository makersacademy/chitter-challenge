require 'user'

describe User do
  let!(:user) { User.create(email: 'test@test.com',
                            username: 'Test', 
                            password: 'secret123') }

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
end
