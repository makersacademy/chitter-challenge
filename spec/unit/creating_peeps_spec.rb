require 'spec_helper'
require 'database_helpers'

describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create(message: 'This is my first peep', name: 'Jo')
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.name).to eq 'Jo'
    expect(peep.message).to eq 'This is my first peep'
  end
end