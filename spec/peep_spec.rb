require 'peep'

describe Peep do
  let(:subject){ described_class.new(message: 'test comment') }
  it 'should store a message' do
    expect(subject.message).to eq 'test comment'
  end
end
