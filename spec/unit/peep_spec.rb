require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      expect(Peep.create(peep: "Hello, World!")).to be_a_kind_of(Peep)
    end
    it 'creates peep with correct content' do
      expect(Peep.create("Hello, World!").peep).to eq("Hello, World!")
    end
  end 
end
