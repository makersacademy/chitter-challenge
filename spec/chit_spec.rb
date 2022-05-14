require './lib/chit'

describe Chit do
  describe '.all' do
    it 'returns all chits' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO chits (chit) VALUES ('help I''m tired yo');")
      connection.exec("INSERT INTO chits (chit) VALUES ('Can I just shock you? I like wine');")
      connection.exec("INSERT INTO chits (chit) VALUES ('My cat was right about you');")
      chits = Chit.all
      expect(chits).to include("help I'm tired yo")
      expect(chits).to include("Can I just shock you? I like wine")
      expect(chits).to include("My cat was right about you")
    end
  end
end
