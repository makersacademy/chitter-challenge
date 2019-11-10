require 'feed'

describe Feed do
  subject(:feed) { described_class.new }
  let (:peep) { double(:peep) }
  let (:peep2) { double(:peep2) }
  it 'can add a peep' do
    expect(feed).to respond_to(:add_peep)
  end
  it 'prints peeps' do
    feed.add_peep(peep)
    feed.add_peep(peep2)
    expect(feed.print).to include peep && peep2
  end
end
