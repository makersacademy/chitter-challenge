require_relative '.././lib/chitter_model'
require 'pg'

RSpec.describe ChitterModel do
  describe '.all' do
    it 'shows all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep_table (peep) VALUES('It is cold today')")
      database_query = ChitterModel.all
      expect(described_class.all).to eq(database_query)
    end
  end

  describe '.create' do
    it 'stores users post into database' do
      connection = PG.connect(dbname: 'chitter_test')
      ChitterModel.create('This is first peep')
      expect(described_class.all).to eq(described_class.all)
    end
  end
end
