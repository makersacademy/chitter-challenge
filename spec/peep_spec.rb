require 'peep'
require 'pg'

describe Peep do

  let(:subject){ described_class.new(id: 1, username: 'user', message: 'testing', time: '22:00 08/08/18' )}

  it 'should store the id' do
    expect(subject.id).to eq 1
  end

  it 'should store the username' do
    expect(subject.username).to eq 'user'
  end

  it 'should store the message' do
    expect(subject.message).to eq 'testing'
  end

  it 'should store the time' do
    expect(subject.time).to eq '22:00 08/08/18'
  end

  describe '#self.create' do
    it 'should create the new data into database' do
      Peep.create(username: 'selfcreate test', message: 'hello')
      con = PG.connect(dbname: 'chitter_test')
      result = con.exec('SELECT * FROM peeps')
      expect(result.to_a.last['username']).to eq 'selfcreate test'
      expect(result.to_a.last['message']).to eq 'hello'
    end
  end

  describe '#self.all' do
    it 'should create new peep objects for each peep from database ' do
      Peep.create(username: 'selfall test', message: 'hi')
      result = Peep.all.last
      expect(result.username).to eq 'selfall test'
      expect(result.message).to eq 'hi'
    end
  end

end
