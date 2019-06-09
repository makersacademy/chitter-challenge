require 'user'

describe User do
  it 'should return its username and ID' do
    example = described_class.new(1, 'RickV')
    expect(example.id).to eq(1)
    expect(example.user_name).to eq('RickV')
  end
end
