require 'peep'

describe Peep do
  describe '.all' do

    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep, time) VALUES ('Test Peep 1', '11:00');")
      connection.exec("INSERT INTO peeps (peep, time) VALUES ('Test Peep 2', '11:30');")
      connection.exec("INSERT INTO peeps (peep, time) VALUES ('Test Peep 3', '11:45');")
      
      all_peeps = Peep.all

      expect(all_peeps[2].peep).to include("Test Peep 1")
      expect(all_peeps[1].peep).to include("Test Peep 2")
      expect(all_peeps[0].peep).to include("Test Peep 3")
    end

  end

end
