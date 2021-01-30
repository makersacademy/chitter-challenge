describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Good')

    expect(Peep.all).to include 'Good'
  end
end