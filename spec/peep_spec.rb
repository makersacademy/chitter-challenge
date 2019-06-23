require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      
      peep = Peep.create(username: "johndoe", text: "This is the first peep")
      Peep.create(username: "johndoe", text: "This is the second peep")
      Peep.create(username: "johndoe", text: "This is the third peep")
     
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.username).to eq "johndoe"
      expect(peeps.first.text).to eq "This is the first peep"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(username: 'johndoe', text: "This is the first peep")
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.username).to eq "johndoe"
      expect(peep.text).to eq "This is the first peep"
    end
  end

end