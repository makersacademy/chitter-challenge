describe '.create' do
  it 'creates a new peep' do
    Peep.create(message: 'This is my first peep')

    expect(Peep.all).to include 'This is my first peep'
  end
end