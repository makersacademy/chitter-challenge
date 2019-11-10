describe Peep do
  it 'creates a new peep when #create is called' do
    expect(Peep.create(content: 'Hello')).to be_a Peep
  end

  it 'returns a list of peeps when #all is called' do
    Peep.create(content: 'Hello, world')
    expect(Peep.all).to be_an Array
  end

  it 'returns the content of the first peep when #all.first.content is called' do
    Peep.create(content: 'Hello, world')
    expect(Peep.all.first.content).to eq 'Hello, world'
  end
end
