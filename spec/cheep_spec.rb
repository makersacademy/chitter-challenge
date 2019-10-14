require 'cheep'

describe Cheep do
  describe ".all" do
    it 'returns a list of current cheeps' do

      cheep = Cheep.create(text: 'first cheep')
      Cheep.create(text: 'second cheep')
      Cheep.create(text: 'third cheep')

      cheeps = Cheep.all

      expect(cheeps.first.text).to eq("first cheep")
      expect(cheeps.length).to eq 3
      expect(cheeps.first.id).to eq cheep.id
    end

    describe '.delete' do
    it 'deleted the selected cheep' do
      cheep = Cheep.create(text: 'I am doomed')

      Cheep.delete(id: cheep.id)
      expect(Cheep.all.length).to eq 0
    end
  end
end
end
