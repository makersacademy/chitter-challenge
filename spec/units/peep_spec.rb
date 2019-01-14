require 'peep'

describe 'Peep' do

  subject(:peep) { Peep.create(
    :content => "This is my first peep"
    )}

  it 'Returns the content of the peep' do
    expect(peep.content).to eq "This is my first peep"
  end

end
