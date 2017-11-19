require './app/models/peep'

describe Peep do

  let(:subject) { described_class.new }

  describe 'initialize' do
    it 'can be initialized' do
      expect(subject).to be_an_instance_of(Peep)
    end
  end
end
