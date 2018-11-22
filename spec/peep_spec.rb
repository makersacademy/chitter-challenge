describe Peep do

  it 'can create peep' do
    peep = Peep.create(description: 'This is my first peep')
    result = peep.map{|peep| peep}
    
    expect(result.first['description']).to eq('This is my first peep')
  end

end
