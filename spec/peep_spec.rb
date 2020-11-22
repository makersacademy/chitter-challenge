require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all my peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      # Test data
      connection.exec("INSERT INTO peeps (post) VALUES ('Hello world, this is my first peep');")
      connection.exec("INSERT INTO peeps (post) VALUES ('I am going to let people know what I am doing');")
      connection.exec("INSERT INTO peeps (post) VALUES ('Every little thing');")

      peeps = Peep.all

      expect(peeps).to include('Hello world, this is my first peep')
      expect(peeps).to include('I am going to let people know what I am doing')
      expect(peeps).to include('Every little thing')
    end
  end

  describe '.create' do
    it 'posts a new peep to Chitter' do
      Peep.create(post: 'I had toast for breakfast')
      expect(Peep.all).to include('I had toast for breakfast')
    end
  end
end

      # Chitter.create('Hello world, this is my first peep')
      # Chitter.create("I'm going to let people know what I'm doing")
      # Chitter.create('Every little thing')
      #
      # peeps = Chitter.all
      #
      # expect(peeps.length).to eq 3
      # expect(peeps.first).to be_a Chitter
      # expect(peeps.last.id)
