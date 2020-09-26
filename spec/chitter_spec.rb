require 'chitter'

describe '.show' do
  it 'returns a list of tweets' do
    expect(Chitter.show).to include('There are owls in your gravy')
  end
end