require 'peep'

RSpec.describe Peep do

  describe '.all' do

    it 'has 1 peep' do
      connection = PG.connect(dbname: 'chitter_chatter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")

      expect(Peep.all.size).to eq 1
    end

    it 'has the content of the first peep' do
      connection = PG.connect(dbname: 'chitter_chatter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")

      expect(Peep.all.first.content).to eq 'This is my first peep'
    end

    it 'has the content of the second peep' do
      connection = PG.connect(dbname: 'chitter_chatter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my second peep');")

      expect(Peep.all.last.content).to eq 'This is my second peep'

    end

    it 'has two peeps' do
      connection = PG.connect(dbname: 'chitter_chatter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my second peep');")

      expect(Peep.all.size).to eq 2
    end
  end

  describe '.create' do

    it 'a new peep assigned to a user' do
      Peep.create(content: 'This is a test', user_id: 1)
      peeps = Peep.all

      expect(peeps.first.content).to eq 'This is a test'
      expect(peeps.first.user_id).to eq(1)
    end

  end

end
