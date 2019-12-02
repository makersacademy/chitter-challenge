require 'peep'

describe Peep do
  describe '#initialize' do
    it 'stores id and body' do
      peep = Peep.new(id: 1, body: "first peep")
      expect(peep.id).to eq(1)
      expect(peep.body).to eq("first peep")
    end
  end
end
