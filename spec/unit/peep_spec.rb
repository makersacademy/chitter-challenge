require './app/models/peep'
require 'database_helper'

describe Peep do

  context '#all' do
    it 'returns all the posts' do
      peep = Peep.create(content: 'This is my first Chitter Post.')
      Peep.create(content: 'Sunny today eh?')

      peeps = Peep.all
      expect(peep).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'This is my first Chitter Post.'
      expect(peeps.first.date).to eq peep.date
    end
  end

  context '#create' do
    it 'creates a new post' do
      peep = Peep.create(content: 'This is my first Chitter Post.')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'This is my first Chitter Post.'
    end
  end
end