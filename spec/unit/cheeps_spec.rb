require 'cheeps'
# require 'pg'
describe Cheeps do
  describe '.all' do
    it 'returns all cheeps' do
      Cheeps.create(cheep: 'this is a test cheep')
      Cheeps.create(cheep: 'this is a 2nd cheep')
      Cheeps.create(cheep: 'oh, look a third!')
      cheeps = Cheeps.all

      expect(cheeps.length).to eq 3
      expect(cheeps.first).to be_a Cheeps
      expect(cheeps.first.cheep).to include('this is a test cheep')
    end
  end

  describe '.create' do
    it 'creates a new cheep' do
      cheep = Cheeps.create(cheep: 'Another test cheep!')

      expect(cheep).to be_a Cheeps
      expect(cheep.cheep).to eq 'Another test cheep!'
    end
  end

  describe '.reverse' do
    it 'reverses the cheeps chronologically' do
      Cheeps.create(cheep: 'this is a test cheep', time: Time.new(2020, 1, 1))
      Cheeps.create(cheep: 'this is a 2nd cheep', time: Time.new(2020, 2, 2))
      Cheeps.create(cheep: 'oh, look a third!', time: Time.new(2020, 3, 3))
      cheeps = Cheeps.reverse

      expect(cheeps.first.cheep).to eq 'oh, look a third!'
      expect(cheeps.last.cheep).to eq 'this is a test cheep'
    end
  end
end
