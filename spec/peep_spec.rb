describe '.all' do
  it 'returns a list of peeps' do
    
    peep = Peep.create(message: 'Testing id')
    Peep.create(message: 'Test peep 1')
    Peep.create(message: 'Test peep 2')
    Peep.create(message: 'Test peep 3')

    peeps = Peep.all

    expect(peeps.size).to eq 4
    expect(peeps.first).to be_a Peep
    expect(peeps.first.message).to eq 'Test peep 3'
    expect(peeps.last.id).to eq peep.id
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Testing, testing, 1, 2, 3')
  
      expect(peep.message).to eq 'Testing, testing, 1, 2, 3'
    end 
  end 
end
