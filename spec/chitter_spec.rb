require_relative '../lib/chitter'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      chitters = Chitter.all

      expect(chitters).to include('this is a test, should be Ginny as user')
      expect(chitters).to include('this is another test message, Ginny as user')
      expect(chitters).to include('test message, Jon as user')
      expect(chitters).to include('Grace as user')
    end
  end
end
