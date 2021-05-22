require 'chitter'
require 'database_helper'
describe Chitt do
  describe '.create' do
    it 'Creates a chirp' do
      chirp = Chitt.create(chirp: 'peep')
      persisted_data = persisted_data(id: chirp.id)
      p chirp
      p "here"
      expect(chirp.id).to eq(persisted_data['id'])
      expect(chirp).to be_a(Chitt)
      expect(chirp.chirp).to eq('peep')
    end
  end

  describe '.all' do
    it 'displays all the chirps' do
      chirp = Chitt.create(chirp: 'Test 1')
      Chitt.create(chirp: 'Test 2')
      Chitt.create(chirp: 'Test 3')

      chirps = Chitt.all
      expect(chirps.length).to eq(3)
      expect(chirps.first).to be_a(Chitt)
      expect(chirps.first.id).to eq(chirp.id)
      expect(chirps.first.chirp).to eq('Test 1')
    end
  end

end
