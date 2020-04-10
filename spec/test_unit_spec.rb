require 'test_unit'

describe TestUnit do
  it 'has a test method' do
    expect(subject).to respond_to :test
  end
end