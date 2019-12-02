require 'peep'

describe Peep do
  describe '#initialize' do
    it 'stores id and body' do
      peep = Peep.new(:id, :body)
      expect(peep.id).to eq(:id)
      expect(peep.body).to eq(:body)
    end
  end
end
