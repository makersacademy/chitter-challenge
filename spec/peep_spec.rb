require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Going to the beach today')
      expect(peep.first['message']).to eq('Going to the beach today')
    end
  end

  describe '.all_peeps' do
    it "returns all peeps from database" do
      Peep.create(message: 'Going to the beach today')
      Peep.create(message: 'The Lions will beat the Springboks')
      
      expect(Peep.all_peeps.length).to eq 2
      expect(Peep.all_peeps.first.message).to eq('Going to the beach today')
      # expect(Peep.all_peeps.message).to include('The Lions will beat the Springboks')
    end
  end
end
