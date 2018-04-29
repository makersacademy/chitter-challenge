require 'user'

describe User do

  let(:subject) { described_class.create(id: 1, name: 'myname', email: 'abc@gmail.com', username: 'user', password: '12345') }

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

  describe '#self.create' do
    it 'should create the new data into database' do
      User.create(name: 'createname', email: 'def@gmail.com', username: 'selfcreate', password: '45678')
      con = PG.connect(dbname: 'chitter_test')
      result = con.exec('SELECT * FROM users')
      expect(result.to_a.last['name']).to eq 'createname'
      expect(result.to_a.last['email']).to eq 'def@gmail.com'
      expect(result.to_a.last['username']).to eq 'selfcreate'
    end
  end

  describe '#self.all' do
    it 'should create new user objects for each user from database ' do
      User.create(name: 'name', email: 'ghi@gmail.com', username: 'selfall', password: '66666')
      result = User.all.last
      expect(result.name).to eq 'name'
      expect(result.email).to eq 'ghi@gmail.com'
      expect(result.username).to eq 'selfall'
    end
  end

end
