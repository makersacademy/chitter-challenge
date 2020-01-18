require_relative '../lib/user'

describe User do
  let(:subject) { User }

  describe '.all' do
    it { expect(subject.all).to be_a Array }

    it 'wraps database data in User object and assigns instance variables' do
      subject.create(name: 'name2', username: 'username2', email: 'name2@email.com', password: 'password')
      expect(subject.all.first.name).to eq 'name2'
      expect(subject.all.first.username).to eq 'username2'
      expect(subject.all.first.email).to eq 'name2@email.com'
      expect(subject.all.first.password).to eq 'password'
    end

  end

  describe '.create' do
    it 'creates a new user record in the user databse' do
      subject.create(name: 'name3', username: 'username3', email: 'name3@email.com', password: 'password')
      expect(subject.all.first.name).to include('name3')
    end
  end
end