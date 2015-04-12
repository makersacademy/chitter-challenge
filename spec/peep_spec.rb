require 'spec_helper'

describe Peep do
  it 'creates new peep in the database' do
    expect(described_class.count).to eq(0)
    described_class.create(peep: 'Today is good')
    expect(described_class.count).to eq(1)
    peep = described_class.first
  end
end
