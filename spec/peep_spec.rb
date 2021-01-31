require "peep"

describe '.feed' do
  it 'returns a feed of the peeps' do
    peep = Peep.feed

    expect(peep).to include 'this is my first peep'
    expect(peep).to include 'this is my second peep'
    expect(peep).to include 'this is my third peep'
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: "this is my first peep")

      expect(Peep.feed). to include "this is my first peep"
    end
  end
end
