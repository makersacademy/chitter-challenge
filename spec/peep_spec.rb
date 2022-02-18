require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'shows all the peeps' do
      peep = Peep.create(peep: "First peep", user_id: "Eddie")
      Peep.create(peep: "Second peep", user_id: "Eddie")
      Peep.create(peep: "Third peep", user_id: "Eddie")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peep.user_id).to eq "Eddie"
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.peep).to eq "First peep"
      expect(peep.peep_created).to include Date.today.to_s

    end
  end

  describe '.create' do
    it "creates a new peep for the user" do
      peep = Peep.create(peep: 'A new peep', user_id: "Eddie")
      persisted_data = persisted_data(id: peep.id)
      
      expect(peep).to be_a Peep
      expect(peep.user_id).to eq "Eddie"
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq 'A new peep'
      expect(peep.peep_created).to include Date.today.to_s
      
    end
  end
end