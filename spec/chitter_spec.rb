require 'chitter'
require 'db_helper'

describe Chitter do
  describe '.all' do
    it 'return all posts' do
      chitter = Chitter.create(message: '1st post')
      Chitter.create(message: '2nd post')
      Chitter.create(message: '3rd post')

      chitters = Chitter.all
      
      expect(chitters.length).to eq 3
      expect(chitters.first).to be_a Chitter
      expect(chitters.first.id).to eq chitter.id
      expect(chitters.first.message).to eq "1st post"
      expect(chitters.first.date).to eq chitter.date
    end
  end

  describe '.create' do
    it 'returns a new post (chitter)' do
      chitter = Chitter.create(message: 'We are getting there!')
      persisted_data = persisted_data(id: chitter.id)

      expect(chitter).to be_a Chitter
      expect(chitter.id).to eq persisted_data['id']
      expect(chitter.message).to eq "We are getting there!"
      expect(chitter.date).to eq chitter.date
    end
  end
end
