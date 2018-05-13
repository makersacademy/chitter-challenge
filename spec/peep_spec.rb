require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("Byte me!")
      expect(peeps).to include("String me_along")
      expect(peeps).to include("SQL Clause is coming to town!")
    end
  end
end
