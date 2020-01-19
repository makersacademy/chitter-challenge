require './lib/models/user'

describe User do
  let(:subject) { User }

  describe '.all' do
    it 'initializes a new instance from database row' do
      expect(subject.all.first).to be_a User
      expect(subject.all.first.username).to eq 'tommygun'
    end
  end

  describe '.create' do 
    it 'adds a user to the database' do
      User.create(username: 'loudmouth', name: 'loud mouth', email: 'loudmouth@hotmail.com', password: '00100100')
      expect(subject.all.last.username).to eq 'loudmouth'
    end

    it 'does not create a user if email is invalid' do
      expect(User.create(username: 'loudmouth', name: 'loud mouth', email: 'loudmouth@', password: '00100100'))
      .to eq false
    end
  end

  describe '.update' do
    it 'updates the password' do
      User.update(parameter: 'password', uid: User.all.last.uid, data: 'new_password')
      expect(User.all.last.password).to eq 'new_password'
    end
  end

end