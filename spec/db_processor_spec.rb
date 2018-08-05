require './model/db_processor'
describe DbProcessor do
  let(:connection) { PG.connect(dbname: 'chitter-test', password: 'qweasd') }
  before(:each)    { add_twats_to_db }
  context 'Write-methods' do
    describe '#.write' do
      it { expect(DbProcessor).to respond_to(:write).with(2).arguments }
      it 'can add a message to the db' do
        DbProcessor.write({ msg: 'My name is earl', time: test_date }, 'twats')
        expect(DbProcessor.read('twats').last).to eq({ date: test_date, msg: 'My name is earl' } )
      end
    end
  end
  context 'Read-methods' do
    describe '#.read' do
      it { expect(DbProcessor).to respond_to(:read).with(1).arguments }
      it { expect(DbProcessor.read('twats')).to eq(testing_twats) }
    end
  end
end
