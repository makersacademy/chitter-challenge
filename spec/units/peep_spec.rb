require 'peep'

describe Peep do
  # before(:each) { truncates }
  # before(:each) { add_peeps }

  it '#create adds a new Peep to database' do 
    Peep.create('Lin', '@LinnyCoder', 'Oh cool! I can add a new peep too!')
    output = Peep.all
    expect(output.author).to eq('Lin')
    expect(output.handle).to eq('@LinnyCoder')
    expect(output.comment).to eq('Oh cool! I can add a new peep too!')
  end 
end