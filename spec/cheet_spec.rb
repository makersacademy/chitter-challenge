require 'cheet'

describe Cheet do

  it 'adds a new cheet' do
  cheet = described_class.add_cheet('My cheet','Body of text')
  expect(described_class.all).to include cheet
  end
end
