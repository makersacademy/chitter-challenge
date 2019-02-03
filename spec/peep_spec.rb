require 'peep'
require 'web_helpers'

describe Peep do
  it 'returns a list of cheets' do
    add_test_peeps
    peeps = Peep.all
    expect(peeps.first.peep).to include "First peep"
  end

end
