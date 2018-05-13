require './lib/user'

describe User do
  let(:email) { 'test@test.com' }
  let(:password) { 'test' }

  describe '.create' do
    it 'has create and id attributes' do
      user = User.create(email, password)

      expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users as instance of user' do
      user = User.create(email, password)

      expect(User.all.last.id).to eq user.id
    end
  end
end
