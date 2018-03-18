require 'peep.rb'

describe 'Peep' do
  describe '.create' do
    it 'creates a new peep' do
      Peep.create(username: 'Raefe01', message: 'This is my first post on chitter!')
      expect(Peep.all[1]).to have_attributes(id: '2', username: 'Raefe01', message: 'This is my first post on chitter!')
    end
  end
end
