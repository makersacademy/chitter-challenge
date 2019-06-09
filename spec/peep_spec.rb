require 'peep'

describe Peep do
  it 'should return its content, time of posting and id' do
    example = described_class.new(1, "Here's the words", '2019-06-09 12:00', 1)
    expect(example.id).to eq(1)
    expect(example.content).to eq("Here's the words")
    expect(example.posted_at).to eq('2019-06-09 12:00')
  end
end