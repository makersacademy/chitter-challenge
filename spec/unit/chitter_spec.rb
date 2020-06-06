require 'chitter'

describe Chitter do
  it 'Has a create method' do
    expect(Chitter).to respond_to(:create)
  end
end