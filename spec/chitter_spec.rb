require 'chit'

describe 'all' do
  it 'shows a list of all chits' do
    Chit.create("hey!")
    Chit.create("bye!")
    chits = Chit.all
    expect(chits).to include("hey!")
    expect(chits).to include("bye!")
  end
end
