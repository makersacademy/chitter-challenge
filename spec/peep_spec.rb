require_relative '../lib/peep.rb'

describe Peep do
  context '#peeps' do
    it 'adds peep to the peeps list' do
      peeps = Peep.peeps
      expect(subject.peeps).to include peeps
    end
  end
end
