require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include "hello everyone"
      expect(peeps).to include "Still got this bloomin lurgy and high temperature."
      expect(peeps).to include "Why is he sniffing so much?"
      expect(peeps).to include "I am in the curry house"
    end
  end
end