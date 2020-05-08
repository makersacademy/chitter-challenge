describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create(message: 'This is my first peep', name: 'Jo').first

    expect(peep['message']).to eq 'This is my first peep'
    expect(peep['name']).to eq 'Jo'
  end
end