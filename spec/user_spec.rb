require 'user'

describe User do
  subject(:bitterman) { described_class.new('Bitterman', 'bitterman@aol.com', 'wad21esad12') }
  describe '.new' do
    it 'accepts 3 arguments at init' do
      expect{described_class.new('Bitterman', 'bitterman@aol.com', 'wad21esad12')}.to_not raise_error
    end
  end
end
