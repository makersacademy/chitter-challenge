require 'peeps'

describe Peeps do

  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'makers_peeps_test')

      connection.exec("INSERT INTO peeps (message) VALUES('Sunday brunch');")
      connection.exec("INSERT INTO peeps (message) VALUES('Tea and toast');")

      peeps = Peeps.all
      expect(peeps).to include("Sunday brunch")
      expect(peeps).to include("Tea and toast")
    end
  end

  describe '.post' do
    it 'posts a new peep to the feed' do
      Peeps.post(message: 'Sunday brunch')
      Peeps.post(message: 'Tea and toast')
      expect(Peeps.all).to include 'Sunday brunch'
      expect(Peeps.all).to include 'Tea and toast'
    end
  end


end
