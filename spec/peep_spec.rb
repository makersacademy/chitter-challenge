require 'peep'

describe '.post' do
  it 'posts a new peep' do
    peep = Peep.post("this is a new peep")
    expect(peep).to be_a Peep
    expect(peep.message). to eq "this is a new peep"
  end
end
