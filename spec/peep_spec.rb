require 'peep'
require_relative './database_helper'

describe Peep do
  context '#post'
  it 'can create a new peep' do
    peep = Peep.create('Test peep', 'tc1316')
    persisted_data = persisted_data(peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.content).to eq 'Test peep'
    expect(peep.username).to eq 'tc1316'
  end
end