require 'peep'
require 'pg'
require_relative '../helper_methods.rb'

describe Peep do
  let(:con) { PG.connect test_database }
  let(:test_database) { { dbname: 'chitter_chatter_test' }}

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: "Henlo World")

      expect(peep).to be_a Peep
      expect(peep.message).to eq "Henlo World"
    end
  end

end
