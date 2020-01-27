require './lib/models/user'

describe User do
  let(:subject) { User }
  let(:subject2) { User.login('tommygun', '00100100') }

  describe '.all' do
    it 'initializes a new instance from database row' do
      expect(subject.all.first).to be_a User
      expect(subject.all.first.username).to eq 'tommygun'
    end
  end

  describe '.create' do 
    it 'adds a user to the database' do
      subject.create(username: 'loudmouth', name: 'loud mouth', email: 'loudmouth@hotmail.com', password: '00100100')
      expect(subject.all.last.username).to eq 'loudmouth'
    end

    it 'does not create a user if email is invalid' do
      expect(subject.create(username: 'loudmouth', name: 'loud mouth', email: 'loudmouth@', password: '00100100'))
      .to eq false
    end
  end

  describe '.update' do
    it 'updates the password' do
      subject.update(parameter: 'password', uid: subject.all.last.uid, data: 'new_password')
      expect(subject.all.last.password).to eq 'new_password'
    end
  end

  describe '.delete' do
    it 'deletes the user' do
      subject.delete(uid: User.all.last.uid)
      expect(subject.all).to be_empty
    end
  end

  describe '.login' do
    it 'returns an instance of User if login details correct' do
      expect(subject.login('tommygun', '00100100')).to be_a User
    end
    it 'returns false with incorrect details' do
      expect(subject.login('tommygun', '1')).to eq false
    end
  end

  describe '#peep' do
    it 'peeps a peep' do
      subject2.peep('test peep')
      expect(Peep.all.last.msg).to eq 'test peep'
    end
  end
  
end
