require 'db_manager'

describe DBManager do
  describe '.setup' do
    it 'should setup db connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DBManager.setup('chitter_test')
    end
  end
  describe '.instance' do
    it 'should return db connection' do
      db = DBManager.setup('chitter_test')
      expect(DBManager.instance).to eq db
    end
  end
  describe '.query' do
    it 'should perform a query on db' do
      expect(DBManager.instance).to receive(:exec).with('SELECT * FROM posts')
      DBManager.query('SELECT * FROM posts')
    end
  end
end
