describe '.all' do
  it 'retuens a list of peeps' do
    peeps = Peeps.all
    expect(peeps).to include "Welcome to Chitter"
    expect(peeps).to include "This is my first Peep"
    expect(peeps).to include "Peeping to my peeps"
  end
end
