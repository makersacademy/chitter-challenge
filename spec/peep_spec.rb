require 'peep'
require 'web_helpers'

describe Peep do
  it 'Returns a list of cheets' do
    add_test_peeps
    peeps = Peep.all
    expect(peeps.first.peep).to include "First peep"
  end
  it 'Can post a new peep' do
    new_peep = Peep.post(peep: 'New peep')
    expect(new_peep.peep).to eq 'New peep'
  end
  it 'Can see time peep was posted' do
    peep = Peep.post(peep: 'New peep')
    expect(peep.time).to eq DateTime.now.to_s
  end

end
