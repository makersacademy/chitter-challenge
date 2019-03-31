require 'cheep'

describe Cheep do
  describe '.post' do
    it 'should add a cheep to a db when called' do
      result = Cheep.post('Test Post String')
      expect(result.post).to eq 'Test Post String'
      expect(result.id).to eq '1'
    end
  end
  describe '.all' do
    it 'should return array of all cheeps when called in reverse order' do
      cheep1 = Cheep.post('Test Post String 1')
      cheep2 = Cheep.post('Test Post String 2')
      cheeps = Cheep.all
      expect(cheeps[0].post).to eq cheep2.post
      expect(cheeps[1].post).to eq cheep1.post
    end
  end
end
