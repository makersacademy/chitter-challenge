# frozen_string_literal: true

require 'quack'
require 'database_helpers'

describe '.all' do
  it 'returns a list of all quacks' do
    Quack.create(message: 'Love is strength', display_name: 'Quackie')
    Quack.create(message: 'Dream it, be it', display_name: 'T0ilet_duck')
    quack = Quack.create(message: 'The last word', display_name: 'Duck_Tape')

    quacks = Quack.all
    loadhour = Time.now.strftime('%F %H:')

    expect(quacks.length).to eq 3
    expect(quacks.first).to be_a Quack
    expect(quacks.first.id).to eq quack.id
    expect(quacks.first.display_name).to eq 'Duck_Tape'
    expect(quacks.first.message).to eq 'The last word'
    expect(quacks.first.time_stamp).to include loadhour
  end

  describe '.create' do
    it 'creates a new quack' do
      quack = Quack.create(message: 'This one is for the create method', display_name: 'TestDuck')
      persisted_data = persisted_data(id: quack.id)

      expect(quack).to be_a Quack
      expect(quack.id).to eq persisted_data['id']
      expect(quack.display_name).to eq 'TestDuck'
      expect(quack.message).to eq 'This one is for the create method'
    end
  end
end
