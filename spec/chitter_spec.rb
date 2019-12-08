require 'chitter'

describe Chitter do
  describe '.all' do
    it 'return all posts' do
      Chitter.create(message: '1st post')
      Chitter.create(message: '2nd post')
      Chitter.create(message: '3rd post')
      
      chitter = Chitter.all
      
      expect(chitter).to include "1st post"
      expect(chitter).to include "2nd post"
      expect(chitter).to include "3rd post"
    end
  end

  describe '.create' do
    it 'returns a new post (chitter)' do
      Chitter.create(message: 'We are getting there!')
      expect(Chitter.all).to include 'We are getting there!'
    end
  end
end
