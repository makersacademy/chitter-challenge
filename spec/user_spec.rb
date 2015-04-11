require 'spec_helper'

describe User do
  it 'creates new user in the database' do
    expect(described_class.count).to eq(0)
    described_class.create(username: 'saramoohead',
                           real_name: 'Sara OC',
                           email: 'saramoo@hotmail.com')
    expect(described_class.count).to eq(1)
    user = described_class.first
  end
end
