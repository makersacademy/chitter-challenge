require 'user'

describe User do

  it 'exists' do
    subject
  end

  it 'includes DataMapper' do
    expect(described_class.ancestors).to include DataMapper::Resource
  end

end
