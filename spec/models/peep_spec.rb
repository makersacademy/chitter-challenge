require_relative '../../app/models/peep'
require 'Timecop'

describe Peep do
  subject(:peep) { described_class }
  content = "hi"
  let(:test_peep) { peep.create(content: content) }

  it 'should contain content' do
    expect(test_peep.content).to eq content
  end

  it 'should have a time it was created' do
    Timecop.freeze do
      test_peep2 = peep.create(content: content, created_at: DateTime.now)
      expect(test_peep2.created_at).to eq DateTime.now
    end
  end

end
