require 'peep'
# (1, 'zerga', 'test comment', '12') }
describe Peep do
  let(:subject){ described_class.new(options(1, 'zerga', 'test comment', '12')) }
  it 'should store a message' do
    expect(subject.message).to eq 'test comment'
  end
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
    end
  end
end
