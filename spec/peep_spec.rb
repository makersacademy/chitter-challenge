# frozen_string_literal: true

require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeped posts' do
      peep = Peep.all

      expect(peep).to include('Got to meet them all!')
      expect(peep).to include('I met Bulbasaur!')
    end
  end
end
