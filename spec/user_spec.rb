require 'user'

describe User do

  it 'exists' do
    subject
  end

  it 'includes DataMapper' do
    expect(described_class.ancestors).to include DataMapper::Resource
  end

  it 'has an id' do
    expect(subject.send(:properties).map(&:name)).to include :id
  end

  it 'has an email' do
    expect(subject.send(:properties).map(&:name)).to include :email
  end

end
