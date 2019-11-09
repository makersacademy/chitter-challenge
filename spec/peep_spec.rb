require 'peep'
require 'database_helpers'

describe Peep do

  describe ".create" do

    it "creates a new peep" do
      peep = Peep.create(text: 'My first peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'My first peep'

    end
  end

end
