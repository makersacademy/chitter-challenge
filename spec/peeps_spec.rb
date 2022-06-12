require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps.last.peep).to eq "hello everyone"
      # expect(peeps).to eq "Still got this bloomin lurgy and high temperature."
      # expect(peeps).to eq "Why is he sniffing so much?"
      # expect(peeps).to eq "I am in the curry house"
    end
  end
end