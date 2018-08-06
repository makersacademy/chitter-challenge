require './models/spec'

describe Peep do
  describe'.all' do
    peeps = Peep.all
    expect(peeps).to include('123')
    expect(peeps).to include('456')
    expect(peeps).to include('789')
  end
end