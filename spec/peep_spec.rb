describe Peep do

  it 'can create peep' do
    peep = Peep.create(description: 'This is my first peep')
    result = peep.map{|peep| peep}

    expect(result.first['description']).to eq('This is my first peep')
  end

  it 'can list all peeps' do
    peep = Peep.create(description: 'This is my first peep')
    Peep.create(description: 'The second peep')
    Peep.create(description: 'The third peep')

    result = Peep.all
    expect(result.first['description']).to eq('This is my first peep')
  end

end
