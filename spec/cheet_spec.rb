# frozen_string_literal: true

require 'chitter'
require 'database_helpers'

describe '.all' do
  it 'returns a list of all cheets' do
    Chitter.create(message: 'Love is strength', display_name: 'cheetie')
    Chitter.create(message: 'Dream it, be it', display_name: 'T0ilet_duck')
    cheet = Chitter.create(message: 'The last word', display_name: 'Duck_Tape')

    cheets = Chitter.all
    loadhour = Time.now.strftime('%F %H:')

    expect(cheets.length).to eq 3
    expect(cheets.first).to be_a Chitter
    expect(cheets.first.id).to eq cheet.id
    expect(cheets.first.display_name).to eq 'Duck_Tape'
    expect(cheets.first.message).to eq 'The last word'
    expect(cheets.first.time_stamp).to include loadhour
  end

  describe '.create' do
    it 'creates a new cheet' do
      cheet = Chitter.create(message: 'This one is for the create method', display_name: 'TestCheet')
      persisted_data = persisted_data(id: cheet.id)

      expect(cheet).to be_a Chitter
      expect(cheet.id).to eq persisted_data['id']
      expect(cheet.display_name).to eq 'TestCheet'
      expect(cheet.message).to eq 'This one is for the create method'
    end
  end
end
