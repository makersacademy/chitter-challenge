require 'peep.rb'

describe Peep do
  # subject(:peep) { described_class.new }
  context 'allows posting messages' do
    it 'saves and post peeps on the website' do
      peep =  Peep.message
      expect(peep).to include "Your New Peep is now life!"
    end
  end
end
