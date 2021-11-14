describe Peep do
  describe '.create' do
    it 'creates a new bookmark' do
      peep = Peep.create(message: 'This is a test Peep!', post_time: Time.now.to_s)
      expect(peep.message).to eq 'This is a test Peep!'
      expect(peep.post_time).to eq Time.now.to_s
    end
  end
end
