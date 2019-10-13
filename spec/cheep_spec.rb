require 'cheep'

describe Cheep do
  describe ".all" do
    it 'returns a list of current cheeps' do

      connection = PG.connect(dbname: 'chitter_test')

      cheep = Cheep.create(text: 'first cheep')
      Cheep.create(text: 'first cheep')
      Cheep.create(text: 'first cheep')

      cheeps = Cheep.all

      expect(cheeps.first.text).to eq("first cheep")
      expect(cheeps.length).to eq 3
      expect(cheeps.first.id).to eq cheep.id
    end
  end
end
