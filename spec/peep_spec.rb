require 'peep'
require 'pg'

describe Peep do  
  # describe "#text" do 
  #   it 'should show the text of the peep' do 
  #     peep = Peep.new(peep: 'this is a test')
  #     expect(peep.peep).to eq 'this is a test'
  #   end 
  # end

  describe '#all' do 
    it 'returns all peeps' do 
      connection = PG.connect(dbname: 'chitter_test')
      Peep.create(peep: 'this is just a test')
      Peep.create(peep: "this is also a test")
      peeps = Peep.all
      expect(peeps.first.peep).to eq 'this is just a test' 
      expect(peeps.last.peep).to eq "this is also a test"
    end
  end

  describe "#create" do 
    it 'should add a new peep to the database' do 
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(peep: "test")
      expect(peep.peep).to eq 'test'
    end
  end
end 