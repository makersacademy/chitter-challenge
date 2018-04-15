require 'user'

describe User do

  let(:subject) { described_class.new(id: 1, name: 'myname', email: 'abc@gmail.com', username: 'user', password: '12345') }

  it 'should stores the id' do
    expect(subject.id).to eq 1
  end

  it 'should stores the name' do
    expect(subject.name).to eq 'myname'
  end

  it 'should stores the email' do
    expect(subject.email).to eq 'abc@gmail.com'
  end

  it 'should stores the username' do
    expect(subject.username).to eq 'user'
  end

  it 'should stores the username' do
    expect(subject.password).to eq '12345'
  end

  describe '#self.create' do
    it 'should create the new data into database' do
      User.create(name: 'createname', email: 'def@gmail.com', username: 'selfcreate', password: '45678')
      con = PG.connect(dbname: 'chitter_test')
      result = con.exec('SELECT * FROM users')
      expect(result.to_a.last['name']).to eq 'createname'
      expect(result.to_a.last['email']).to eq 'def@gmail.com'
      expect(result.to_a.last['username']).to eq 'selfcreate'
      expect(result.to_a.last['password']).to eq '45678'
    end
  end

  describe '#self.all' do
    it 'should create new user objects for each user from database ' do
      User.create(name: 'name', email: 'ghi@gmail.com', username: 'selfall', password: '66666')
      result = User.all.last
      expect(result.name).to eq 'name'
      expect(result.email).to eq 'ghi@gmail.com'
      expect(result.username).to eq 'selfall'
      expect(result.password).to eq '66666'
    end
  end

  describe '#self.signin' do
    it 'should let sign in user to become current user' do
      User.create(name: 'signin', email: 'jkl@gmail.com', username: 'selfsignin', password: '777')
      User.signin('selfsignin', '777')
      expect(User.current_user.name).to eq 'signin'
      expect(User.current_user.email).to eq 'jkl@gmail.com'
      expect(User.current_user.username).to eq 'selfsignin'
      expect(User.current_user.password).to eq '777'
    end
  end

  describe '#self.signout' do
    it 'should let current return nil after user sign out' do
      User.signin('selfsignin', '777')
      User.signout
      expect(User.current_user).to eq nil
    end
  end

end
