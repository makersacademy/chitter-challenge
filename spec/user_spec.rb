require_relative '../lib/user'

describe User do
  let(:subject) { User }

  describe '.all' do
    it { expect(subject.all).to be_a Array }
  end

  describe '.create' do
    it 'creates a new user record in the user databse' do
      user = subject.create(name: 'name2', username: 'username2', email: 'name2@email.com', password: 'password')
      expect(subject.all).to include('name2')
    end
  end
end