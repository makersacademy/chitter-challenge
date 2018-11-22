require 'spec_helper'

RSpec.configure do |config|
  config.before(:each) do
    reset_test_database
  end
end

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(username: 'hulbgoblin', content: 'Bleugh')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.username).to eq 'hulbgoblin'
      expect(peep.content).to eq 'Bleugh'
    end
  end
end
