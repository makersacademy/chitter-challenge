require_relative '../app/models/user'

describe User do
  subject(:user) {described_class}
  let(:email) {'example@example.com'}
  let(:password) {'TopS3cr3t'}
  before(:each) do
    @valid_user = user.create(email: email,
                              name: 'John Doe',
                              username: 'JohnDoe',
                              password: password,
                              password_confirmation: password)
  end
  context 'Authenticating a user' do
    it 'Authenticates a valid user' do
      expect(user.authenticate(email: email,
                               password: password)).to eq @valid_user
    end
    it 'does not authenticate valid user with bad password' do
      expect(user.authenticate(email: email,
                               password: 'dodgy')).to eq nil
    end
    it 'Does not authenticate an invalid user' do
      expect(user.authenticate(email: 'bad@example.com',
                               password: 'passwd')).to eq nil
    end
  end
end
