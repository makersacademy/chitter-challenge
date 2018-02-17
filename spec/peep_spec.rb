require 'peep'

describe Peep do

  subject(:peep) { described_class.new("Hello world!") }

  context 'when initialized' do
    it 'takes a string parameter and assigns it to a "string" attribute' do
      expect(peep.string).to eq "Hello world!"
    end
  end
end
