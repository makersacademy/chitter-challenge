require 'chit'

describe 'all' do
  it 'shows a list of all chits' do
    chits = Chit.all
    expect(chits).to include("hey!")
    expect(chits).to include("bye!")
  end
end
