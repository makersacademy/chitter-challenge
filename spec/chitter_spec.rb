require 'chitter'

describe Chitter do

  describe '.all_peeps' do

    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now}', 'First peep');")
      connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now}', 'Second peep');")
      connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now}', 'Third peep');")

      peeps = Chitter.all_peeps

      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
      expect(peeps).to include("Third peep")
    end

  end

end
