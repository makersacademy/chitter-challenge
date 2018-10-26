require "peep"

describe Peep do
  describe '::create' do

    let(:content) { "Hi there" }
    let(:peep) { Peep.create(content, Time.now).first }

    it 'creates a new peep' do
      expect(peep['content']).to eq content
    end
  end
end
