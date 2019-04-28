require 'peep'

describe Peep do
  describe '.all' do
    it 'lists all peeps' do

    connection = PG.connect(dbname: 'chitter_challenge_test')

      connection.exec("INSERT INTO peeps (peep_content) VALUES ('Test peep 1');")
      connection.exec("INSERT INTO peeps (peep_content) VALUES ('Test peep 2');")

      peeps = Peep.all

      expect(peeps).to include('Test peep 1')
      expect(peeps).to include('Test peep 2')
    end

  end
end
