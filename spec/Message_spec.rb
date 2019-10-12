require 'message'

describe Message do

  it 'creates a new peep' do
    # insert once database has been set up

  end

  describe '.all' do
    it 'displays all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO message (text) VALUES ('Peepin aint easy');")
      connection.exec("INSERT INTO message (text) VALUES ('Look before you peep');")
      connection.exec("INSERT INTO message (text) VALUES ('Im a peep');")

      peeps = Message.all

      expect(peeps).to include("Peepin aint easy")
      expect(peeps).to include("Look before you peep")
      expect(peeps).to include("Im a peep")
    end
  end
end
