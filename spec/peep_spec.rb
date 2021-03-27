require 'peep'

describe Peep do
  let(:new_peep) { Peep.new(1, 'I have eaten way too many brownies! Help!')}

  it 'initializes a peep with an id and a body' do
    expect(new_peep.id).to eq 1
    expect(new_peep.body).to eq 'I have eaten way too many brownies! Help!'
  end

  describe '.all' do
    it 'returns all peeps' do
      expect(Peep.all).to eq 'I have eaten way too many brownies! Help!'
    end
  end
end
