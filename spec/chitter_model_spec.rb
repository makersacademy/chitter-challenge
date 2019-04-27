require_relative '.././lib/chitter_model'
require 'pg'

RSpec.describe ChitterModel do
  describe '.all' do
    it 'shows all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep_table (peep) VALUES('It is cold today')")
      expect(described_class.all).to eq(['It is cold today'])
    end
  end

  describe '.create' do
    it 'stores users post into database' do
      ChitterModel.create('This is first peep')
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep_table (peep) VALUES('This is first peep')")
      expect(described_class.all).to include('This is first peep')
    end
  end
end

