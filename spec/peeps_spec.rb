require './models/peeps'
require 'database_helper'

describe Peeps do

  describe '.create' do
    it 'creates a new peep' do
      peeps = Peeps.create(peep: 'Hi, how are you?', time: Time.now.strftime("%m-%d-%Y %H:%M:%S"))
      persisted_data = persisted_data(id: peeps.id, table: 'messages')

      expect(peeps).to be_a Peeps
      expect(peeps.id).to eq persisted_data['id']
      expect(peeps.peep).to eq 'Hi, how are you?'
      expect(peeps.time).to eq Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      peeps = Peeps.create(peep: 'Hi, how are you?', time: Time.now.strftime("%m-%d-%Y %H:%M:%S"))

      peeps = Peeps.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.peep).to eq 'Hi, how are you?'
      expect(peeps.first.time).to eq Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end
