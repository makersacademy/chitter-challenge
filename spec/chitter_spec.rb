require 'peep'

describe 'all' do
  it 'shows a list of all chits' do
    Peep.create("hey!")
    Peep.create("bye!")
    peeps = Peep.all
    expect(peeps).to include("hey!")
    expect(peeps).to include("bye!")
  end
end
