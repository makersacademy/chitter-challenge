require 'peep'

describe 'Peep' do

  let(:peep) {Peep.new(:content)}
  let(:content) {double(content)}

  it 'Allows new peep instances to accept content' do
    expect(peep.conent).to eq(:content)
  end

end
