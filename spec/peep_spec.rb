describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peeps.all

    expect(peeps).to include "Test peep 1"
    expect(peeps).to include "Test peep 2"
    expect(peeps).to include "Test peep 3"
  end
end
