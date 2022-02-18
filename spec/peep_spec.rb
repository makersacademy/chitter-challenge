require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'shows all the peeps' do
      peep = Peep.create(peep: "First peep")
      Peep.create(peep: "Second peep")
      Peep.create(peep: "Third peep")

      peeps = Peep.all

      allow(Time).to receive(:now).and_return(@time_now)

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.peep).to eq "First peep"
      expect(peep.peep_created).to include Date.today.to_s

    end
  end

  describe '.create' do
    it "creates a new peep for the user" do
      peep = Peep.create(peep: 'A new peep')
      persisted_data = persisted_data(id: peep.id)
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq 'A new peep'
      expect(peep.peep_created).to include Date.today.to_s
      
    end
  end
end