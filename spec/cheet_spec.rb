require 'cheet'

describe Cheet do

  describe '.create' do
    it 'creates a new cheet' do
      newcheet = Cheet.create(content: "new")
      expect(newcheet.content).to eq("new")
    end
  end
  
  describe '.all' do
   it 'returns a list of cheets' do
     # Add the test data
     cheet = Cheet.create(content: "first")
     Cheet.create(content: "second")
     Cheet.create(content: "third")

     cheets = Cheet.all

     expect(cheets.length).to eq 3
     expect(cheets.first).to be_a Cheet
     expect(cheets.first.id).to eq cheet.id
     expect(cheets.first.content).to eq 'first'
    end
  end
end
