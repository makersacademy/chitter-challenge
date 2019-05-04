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
      a_peep = ChitterModel.create(peep: 'This is first peep')
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("SELECT peep FROM peep_table WHERE id = '#{a_peep.id}' ")

      expect(a_peep.peep).to eq(result[0]['peep'])
    end
  end
end
