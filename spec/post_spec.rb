require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns list of all peeps' do 
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps VALUES(1, 'Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.', 'kbrooks', '@kb');")
      connection.exec("INSERT INTO peeps VALUES(2, 'sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.', 'rmacfarlane', '@rmac');")
      connection.exec("INSERT INTO peeps VALUES(3, 'And theres a hand, my trusty fiere! And gies a hand o thine!', 'robertburns', '@burns');")

      peeps = Peep.all #array of hashes?

      expect(peeps).to include( {content: 'Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.', user: "kbrooks", handle: "@kb"} )
      expect(peeps).to include( {content: 'sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.', user: "rmacfarlane", handle: "@rmac"} )
    end 
  end
end