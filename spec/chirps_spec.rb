require 'chirps'

describe Chirps do
  describe '.all' do
    it 'returns all chirps' do
      chirps = Chirps.all

      expect(chirps).to include("This is one chirp")
      expect(chirps).to include("This is another chirp")
      expect(chirps).to include("This is a totally different chirp")
    end
  end
end