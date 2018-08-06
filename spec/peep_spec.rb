require 'peep.rb'

describe Peep do

  #subject(:peep) { described_class.new }

  describe '.all' do
    it 'should return all messages' do
      Peep.add("Daniel", 'In')
      Peep.add("Salimatou", 'Love')
      Peep.add("Thomas", 'My twin')

      expected_peeps = [
        "#{Time.new.strftime("%m/%d/%Y")} at #{Time.new.strftime("%I:%M%p")} : Daniel - In",
        "#{Time.new.strftime("%m/%d/%Y")} at #{Time.new.strftime("%I:%M%p")} : Salimatou - Love",
        "#{Time.new.strftime("%m/%d/%Y")} at #{Time.new.strftime("%I:%M%p")} : Thomas - My twin"
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.add' do
    it 'should let a user add a message' do
      Peep.add("Daniel", 'Hi')
      expect(Peep.all).to include "#{Time.new.strftime("%m/%d/%Y")} at #{Time.new.strftime("%I:%M%p")} : Daniel - Hi"
    end
  end

end
