require 'peeper'
require_relative 'database_helpers'

describe Peep do
  
  describe '.create' do
    it 'A peeper can be created' do
      first_peeper = Peeper.create("Bruce", "Bruce@Bruceiscool.com", "Bruce123", "password")
      persisted_data = persisted_data(table: 'peepers', id: first_peeper.id)

      expect(first_peeper).to be_a Peeper
      expect(first_peeper.id).to eq persisted_data.first['id']
      expect(first_peeper.name).to eq persisted_data.first['name']
      expect(first_peeper.email).to eq persisted_data.first['email']
      expect(first_peeper.username).to eq persisted_data.first['username']
      expect(first_peeper.password).to eq persisted_data.first['password']
    end
  end

end