require 'peep'

describe Peep do
  describe '.post' do
    it 'posts peep' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (peep) VALUES('Hello from user1')")

      peep = Peep.post

      expect(peep).to include('Hello from user1')
    end
  end

  describe '.new' do
    it 'creates new peep' do
      Peep.new(peep: 'Hello from user1')

      expect(Peep.post).to include 'Hello from user1'
    end
  end

end