require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.create(message: 'this is a test')
      peeps = Peeps.all

      expect(peeps.first.message).to eq 'this is a test'
    end
  end
end
