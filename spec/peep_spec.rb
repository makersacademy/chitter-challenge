describe Peep do

  it 'should store peep' do
    peep = Peep.new('This is my first peep')
    expect(peep.content).to eq('This is my first peep')
  end

end
