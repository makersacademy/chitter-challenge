require 'chitter'

describe Chitter do

  describe '#create' do
    it 'can be created with a user_id and content' do
      peep = Chitter.create('1', 'This is a peep')
      expect(peep.user_id).to eq('1')
      expect(peep.content).to eq('This is a peep')
    end
  end

  describe '#all_peeps' do
    it 'returns all peeps ever posted' do
      Chitter.create('1', 'This is a peep')
      Chitter.create('1', 'This is also a peep')
      peeps = Chitter.all_peeps
      expect(peeps[0].content).to eq('This is a peep')
      expect(peeps[1].content).to eq('This is also a peep')
    end
  end

end
