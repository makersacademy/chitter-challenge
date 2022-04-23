require 'peep'

describe Peep do
  let(:date) do
    formatted_time
  end

  describe '.all' do
    it 'returns all peeps' do
      Peep.create(peep: "This is a peep")
      Peep.create(peep: "This is a second peep")
      peep = Peep.create(peep: "Another peep!")
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq peep.text
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do
      peep = Peep.create(peep: "This is a peep")
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      peeps = Peep.all

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq "This is a peep"
      expect(peep.created_at).to eq date
    end
  end
end
