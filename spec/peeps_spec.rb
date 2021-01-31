require 'peeps'

describe Peeps do

  describe '.initialize' do
    it 'will have an empty array upon initlisation' do
      expect(subject.peeps).to be_an(Array)
      expect(subject.peeps).to be_empty
    end
  end

  describe '.add_peep'
end
