require 'chitter'

describe Chitter do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO chitters (peep) VALUES ('Hello, World!');")

      chitters = Chitter.all

      expect(chitters).to include("Hello, World!")
      end
  end

  describe '.time' do
    it 'returns time posted' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO chitters (peep) VALUES ('Hello');")
      
      chitters = Chitter.time

      expect(chitters).to include("posted on:")
    end
  end

end
