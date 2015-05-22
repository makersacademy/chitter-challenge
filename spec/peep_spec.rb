require 'spec_helper'

describe Peep do
  it 'creates new peep in the database' do
    expect(described_class.count).to eq(0)
    described_class.create(peep_content: 'Today is good')
    expect(described_class.count).to eq(1)
    expect(described_class.all.inspect).to include("Today is good")
    peep = described_class.first
  end
end
