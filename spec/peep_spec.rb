require 'peep'

describe Peep do
  describe'.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitterweb_test')

      connection.exec("INSERT INTO peeps (pmessage) VALUES ('Hello');")
      connection.exec("INSERT INTO peeps (pmessage) VALUES ('How are you?');")
      connection.exec("INSERT INTO peeps (pmessage) VALUES ('What are you doing?');")

      peeps = Peep.all

      expect(peeps).to include("Hello")
      expect(peeps).to include("How are you?")
      expect(peeps).to include("What are you doing?")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(pmessage: 'What is the plan?')
      expect(Peep.all).to include 'What is the plan?'
    end
  end
end
