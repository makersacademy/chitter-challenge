require 'peep'

describe Peep do

  describe '#self.all' do
    it 'returns an array' do
      expect(Peep.all).to be_an_instance_of(Array)
    end

    it 'array contains peep instances' do
      index = rand(Peep.all.length)
      expect(Peep.all[index]).to be_an_instance_of(Peep)
    end

    it 'peep instances have the correct attributes' do
      expect(Peep.all[0]).to have_attributes(id: '5', text: 'peep peep', time: 'fifth peep', author: 'Giacomo' )
    end

    it 'returns peep reverse ordered by id (which is also by most recent)' do
      random = rand(3)
      index = (random + 1) * -1
      id = (random + 1).to_s
      expect(Peep.all[index].id).to eq(id)
    end

  end

  describe '#self.all_from' do

    it 'returns a list of peeps from user' do
      index = rand(Peep.all_from('Paola').length)
      expect(Peep.all_from('Paola')[index].author).to eq('Paola')
    end

  end

  describe '#self.post' do

    it 'adds a peep to the database' do
      Peep.post('Helloworld','Ricky','Now')
      expect(Peep.all[0]).to have_attributes(text: 'Helloworld', author: 'Ricky', time: 'Now')
    end

  end

end
