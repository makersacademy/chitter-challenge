require 'peep'

describe Peep do
  before(:each) { truncates }
  # before(:each) { add_peeps }

  it '#create adds a new Peep to database' do 
    Peep.create('Lin', '@LinnyCoder', "Oh cool! I can add a new peep too!")
    output = Peep.all
    expect(output[0].author).to eq('Lin')
    expect(output[0].handle).to eq('@LinnyCoder')
    expect(output[0].content).to include("Oh cool! I can add a new peep too!")
  end 
end