require 'peep'
require 'pg'

describe Peep do  

  describe '#all' do 
    it 'returns all peeps' do 
      connection = PG.connect(dbname: 'chitter_test')
      Peep.create(text: 'this is just a test')
      Peep.create(text: "this is also a test")
      peeps = Peep.all
      expect(peeps.first.text).to eq 'this is just a test' 
      expect(peeps.last.text).to eq "this is also a test"
    end
  end

  describe "#create" do 
    it 'should add a new peep to the database' do 
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(text: "test")
      expect(peep.text).to eq 'test'
    end
  end
end 