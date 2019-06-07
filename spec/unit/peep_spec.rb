require 'peep'

describe Peep do
  describe "#all" do
    it 'can show all peeps' do
      connection = PG.connect(dbname: 'chitter_challenge_test')
      #add test data
      connection.exec("INSERT INTO peeps_table (peep) VALUES ('My first peep');")
      peeps = Peep.all
      expect(peeps).to include("My first peep")
    end
  end

  describe "#post" do
    it 'user can post messages' do
      Peep.post(message: 'This is amazing')
      expect(Peep.all).to include("This is amazing")
    end
  end
end
