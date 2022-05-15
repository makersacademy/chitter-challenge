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

end
