require 'peeps.rb'
require 'pg'


describe 'messages' do
  describe '.all' do
    
  connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (handle, first_name, peep) VALUES ('@KLamar', 'Kendrick', 'New album coming soon :D');")
    connection.exec("INSERT INTO peeps (handle, first_name, peep) VALUES ('@Ronaldo', 'Cristiano', 'Messi is better tbh.');")

    peeps = Peeps.all

    it 'returns list of peeps' do
      expect(peeps).to include("Kendrick (@KLamar): New album coming soon :D")
      expect(peeps).to include("Cristiano (@Ronaldo): Messi is better tbh.")
    end
  end
  
  describe '.new_peep' do
    it 'adds a peep to the website via the database' do

      Peeps.new_peep("Leo", "@Messi10", "I miss Barcelona :(")
      expect(Peeps.all).to include("Leo (@Messi10): I miss Barcelona :(")
    end
  end
end