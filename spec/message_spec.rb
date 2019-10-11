require 'message'

describe Chitter do

  describe '.create' do
    it 'creates a new message' do
      message = Chitter.new

      expect(message).to include("Hello")
    end
  end
end
