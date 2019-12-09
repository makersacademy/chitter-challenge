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
      expect(chitters.last).to be_a Chitter
      expect(chitters.last.id).to eq chitter.id
      expect(chitters.last.message).to eq "1st post"
      expect(chitters.last.date).to eq chitter.date
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

  describe '.delete' do
    it 'removes the post selected' do
      chitter = Chitter.create(message: 'Remove me')
      Chitter.delete(id: chitter.id)

      expect(Chitter.all).to eq []
    end
  end

  describe '.edit' do
    it 'edits the post selected' do
      chitter = Chitter.create(message: '1st post')
      chitter_update = Chitter.edit(id: chitter.id, message: '2nd post')

      expect(chitter_update).to be_a Chitter
      expect(chitter_update.id).to eq chitter.id
      expect(chitter_update.message).to eq '2nd post'
    end
  end
  
  describe '.find' do
    it 'returns the requested Chitter object' do
      chitter = Chitter.create(message: '1st post')

      result = Chitter.find(id: chitter.id)

      expect(result).to be_a Chitter
      expect(result.id).to eq chitter.id
      expect(result.message).to eq '1st post'
    end
  end
end
