require 'peep_feed'

RSpec.describe PeepFeed do
  let(:mock_peep) { double :Peep, new: nil }

  subject { described_class.new(peep_type: mock_peep) }

  it 'gets peeps by id' do
    expect(mock_peep).to receive(:new)
    subject.get_peep(1)
  end

  it 'knows whether a peep is a reply or not' do

  end
end
