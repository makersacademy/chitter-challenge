require 'pg'
require 'peep'

describe Peep do
  describe "add" do
    it 'adds a new peep to the list' do
      peep = Peep.add(content: 'What a fabulous peep I am')

      PG.connect(dbname: 'peep_list_test')

      expect(peep).to be_a Peep
      expect(peep.content).to eq('What a fabulous peep I am')
    end
  end
  describe '#all' do 
    it 'shows all peeps from the database' do 
      connection = PG.connect(dbname: 'peep_list_test')

      connection.exec("INSERT INTO peep_list (peep) VALUES('Tweet number one') returning id, peep")

      expect(Peep.all).to include('Tweet number one')
    end
  end   
  describe '#time' do
    it 'has a timestamp for each peep' do
      peep = Peep.add(content: 'What a fabulous peep I am')
      expect(subject.time.to_s[0..-7]).to eq(Timecop.freeze(Time.now).to_s[0..-13])
    end
  end
end
