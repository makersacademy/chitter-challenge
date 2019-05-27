require 'peep'
require 'database_helpers'

describe Peep do
  describe '#post' do
    it 'should insert an entry into the peep table' do
      peep = Peep.post(text: 'I feel grrrrrreat')
      persisted_data = persisted_data_peeps(id: peep.id)

      expect(peep).to be_an_instance_of Peep
      expect(peep.id).to eq(persisted_data.first['id'])
      expect(peep.text).to eq('I feel grrrrrreat')
    end
  end

  describe '#all' do
    it 'should produce an array of peep entries' do
      Peep.post(text: 'I feel grrrrrreat')
      Peep.post(text: 'I really do')
      peeps = Peep.all
      array = ['I really do', 'I feel grrrrrreat']
      expect(peeps.map { |peep| peep.text }).to eq(array)
    end
  end

  describe '#get_user' do
    it 'should return the name and username of the peep poster' do
      
    end
  end
end
