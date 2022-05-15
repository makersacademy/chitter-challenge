require 'peeps.rb'
require 'pg'


describe 'messages' do
  describe '.all' do
    
  connection = PG.connect(dbname: 'chitter_test')

    it 'returns a list of peeps' do

      peep = Peeps.new_peep('Dave', '@Dave', 'Hi Im Dave')
      Peeps.new_peep('Kendrick', '@KLamar', 'New album coming soon :D')
      Peeps.new_peep('Cristiano', '@Ronaldo', 'Good morning everyone, SUIIIII')
  
      peeps = Peeps.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.first_name).to eq 'Dave'
      expect(peeps.first.handle).to eq '@Dave'
      expect(peeps.first.peep).to eq 'Hi Im Dave'
    end
  end
  
  describe '.new_peep' do
    it 'adds a peep to the website via the database' do

      peep = Peeps.new_peep("Leo", "@Messi10", "I miss Barcelona :(")
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.first_name).to eq 'Leo'
      expect(peep.handle).to eq '@Messi10'
      expect(peep.peep).to eq 'I miss Barcelona :('
    end
  end
end