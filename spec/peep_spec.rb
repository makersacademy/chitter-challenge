require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a message' do
      peep = Peep.create("Hello, World!")
      expect(peep.message).to eq 'Hello, World!'
    end
  end

end
