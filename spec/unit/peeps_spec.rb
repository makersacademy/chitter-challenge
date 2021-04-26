require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all the peeps' do
      con = PG.connect(dbname: 'chitter_test')

      con.exec("INSERT INTO peeps VALUES(1,'You');")
      con.exec("INSERT INTO peeps VALUES(2,'Hello');")
      con.exec("INSERT INTO peeps VALUES (3,'Peep');")

      
      peeps = Peeps.all
      peeps
      expect(peeps.to_s).to include 'Hello'
      expect(peeps.to_s).to include 'You'
      expect(peeps.to_s).to include 'Peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create('Hello')

      expect(Peeps.all.to_s).to include 'Hello'
    end
   # it ' contains the time stamp'do
    # Peeps.create('Hello')
    # expect(Peeps.all).to include(Time.now.to_s[11..-7])
    #end
  end
end