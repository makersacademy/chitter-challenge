require './app/models/peep'
require 'pg'

describe Peep do

  context '#create' do
    it 'creates a new post' do
      peep = Peep.create(post: 'This is my first Peep Post')

      expect(peep).to be_a Peep
      expect(peep.first.id).to eq 1
    end
  end
end