require 'peep'

describe Peep do
  describe '::all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (text) VALUES ('test peep 1'), ('test peep 2'), ('test peep 3');")

      peeps = Peep.all

      expect(peeps).to include('test peep 1')
      expect(peeps).to include('test peep 2')
      expect(peeps).to include('test peep 3')
    end
  end
end