require './model/db_processor'
describe DbProcessor do
  let(:connection) { PG.connect(dbname: 'chittertest', password: 'qweasd') }
  let(:verication) { double :verification }
  before(:each) do 
    add_users_to_db
    add_twats_to_db 
  end
  context 'Write-methods' do
    describe '#.write' do
      it { expect(DbProcessor).to respond_to(:write).with(2).arguments }
      it 'can add a message to the db' do
        DbProcessor.write({ msg: 'My name is earl', time: test_date }, 'twats')
        expect(DbProcessor.read('twats').last).to eq({ date: test_date, msg: 'My name is earl' } )
      end
      it 'can add a user to the db' do
        DbProcessor.write({ username: 'Durain', password: 'password', email: '123@gmail.com', name: 'Durain' }, 'users')
        expect(DbProcessor.read('users').last).to eq({ username: 'Durain', name: 'Durain' })
      end
    end
  end
  context 'Read-methods' do
    describe '#.read' do
      it { expect(DbProcessor).to respond_to(:read).with(1).arguments }
      it { expect(DbProcessor.read('twats')).to eq(testing_twats) }
      it { expect(DbProcessor.read('users')).to eq(testing_users.map { |i| { username: i[:username], name: i[:name]}})}
    end
    describe '#.get_user_id' do
      it { expect(DbProcessor).to respond_to(:get_user_id).with(1).arguments }
      it { expect(DbProcessor.get_user_id('JackIsCool')).to be_an(Integer) }
    end
  end
end
