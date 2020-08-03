require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.add(username: 'Vania', message: 'Cars!')
      expect(Peep.all.length).to eq(1)
    end
  end

end
