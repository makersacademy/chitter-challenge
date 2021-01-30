describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include "Salut!"
    expect(peeps).to include "Ca farte?"
  end
end