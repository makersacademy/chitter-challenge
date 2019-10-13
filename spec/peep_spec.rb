describe Peep do
  subject(:peep) { Peep.create(content: "Stuff") }
  it 'knows its content' do
    expect(peep.content).to eq "Stuff"
  end
  it 'knows its ID' do
    expect(peep.id).to be_a Integer
  end
end