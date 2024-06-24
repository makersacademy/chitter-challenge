require 'peep'

describe Peep do
  let(:peep) {Peep.new("I'm peeping today")}
  it 'holds text' do
    expect(peep.text).to eq "I'm peeping today"  
  end

  describe '#peep' do
    it 'returns the text of peeps' do
      Peep.add("I'm peeping today")
      peeps = Peep.all
      expect(peeps).to be_a Array
      expect(peeps[0].text).to eq "I'm peeping today"
    end
  end
end