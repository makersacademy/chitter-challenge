require_relative '../lib/peep'

describe Peep do
  let(:subject) { Peep }

  describe '.all' do
    it 'returns an array of peeps' do
      expect(subject.all).to include('My first peep')
    end
  end
end