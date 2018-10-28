require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a message' do
      peep = Peep.create(message: "Hello, World!", time: Time.now)
      expect(peep.message).to eq 'Hello, World!'
    end
  end


  describe '.all' do
    it 'returns a list of peeps' do
      Peep.create(message: "Hello, World!", time: Time.now)
      Peep.create(message: "Hello, World again!", time: Time.now)
      Peep.create(message: "Hello, World once more!", time: Time.now)
      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'Hello, World!'
    end
  end

end
