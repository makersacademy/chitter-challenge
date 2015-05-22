require_relative 'spec_helper'

describe Peep do
  context "Demonstration of how datamapper works" do
    it 'adding a message' do
      expect(Peep.count).to eq(0)
      Peep.create(message: "Hello my first peep!")
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.message).to eq("Hello my first peep!")
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end