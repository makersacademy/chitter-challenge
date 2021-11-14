describe Peep do
  describe '.create' do
    it 'creates a new bookmark' do
      peep = Peep.create(message: 'This is a test Peep!')
      expect(peep.message).to eq 'This is a test Peep!'
    end
  end
end
