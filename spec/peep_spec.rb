require 'peep'

describe Peep do

  describe '#.show' do

    it 'shows messages on database in reverse chronological order' do

      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('First');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Second');")
      expect(Peep.show).to eq ['Second', 'First']

    end

  end

  describe '#.post' do

    it 'inserts a message in the database' do

      Peep.post('Message 1')
      Peep.post('Message 2')
      expect(Peep.show).to include('Message 1', 'Message 2')

    end

  end

end
