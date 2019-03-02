require 'peep' 

describe 'Peep' do

  it 'allows user to create a peep' do
    new_peep = Peep.create(body: "test peep")
    expect(new_peep).to eq "test peep"
  end

end
