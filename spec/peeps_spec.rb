require 'peeps'

describe Peeps do

  describe '#all' do
    it 'Will return all peeps' do
        expect(Peeps.all.first.message).to eq('TEST DATA')
    end
  end

  describe '#create' do
    it 'will add a new peep to the database' do
        Peeps.create('ADD PEEP TEST DATA')
        expect(Peeps.all.last.message).to eq('ADD PEEP TEST DATA')
    end
  end

end


