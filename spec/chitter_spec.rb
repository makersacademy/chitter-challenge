require 'chitter'

describe Chitter do
  describe '.all' do
    it 'return all posts' do
      chitter = Chitter.all
      expect(chitter).to include "1st post"
      expect(chitter).to include "2nd post"
      expect(chitter).to include "3rd post"
    end
  end
end