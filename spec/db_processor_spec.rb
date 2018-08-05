require './model/db_processor'
describe DbProcessor do
  let(:connection) { PG.connect(dbname: 'chitter-test', password: 'qweasd') }
  before(:each)    { add_twats_to_db }
  context 'configuration methods' do
    describe '#.configure' do
      it { expect(DbProcessor).to respond_to(:connection) }
      it 'loads the testing database by default' do
        expect(DbProcessor.connection.exec(
           'SELECT * FROM current_catalog'
           ).map { |item| item['current_catalog'] }.join).to eq('chitter-test') 
      end
      # todo write non test database test
    end
  end
  context 'Write-methods' do
    describe '#.write' do
      it { expect(DbProcessor).to respond_to(:write).with(2).arguments }
      it 'can add a message to the db' do
        DbProcessor.write('My name is earl', 'twats')
        expect(DbProcessor.read('twats').last).to eq('My name is earl')
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
