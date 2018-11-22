describe Peep do

  it 'can create peep' do
    peep = Peep.create('This is my first peep')
    expect(peep.first[:description]).to eq('This is my first peep')
  end

end
