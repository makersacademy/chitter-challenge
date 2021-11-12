require_relative '../lib/chitter.rb'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Chitter.all

      expect(peeps).to include('this is a test, should be Ginny as user')
      expect(peeps).to include('this is another test message, Ginny as user')
      expect(peeps).to include('test message, Jon as user')
      expect(peeps).to include('Grace as user')
    end
  end
end
