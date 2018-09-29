require 'timecop'
require './models/peep'

describe Peep do
  subject { described_class }
  describe 'On creation' do
    it '.all returns empty array' do
      expect(Peep.all).to be_empty
    end
  end

  describe '.add' do
    it { is_expected.to respond_to(:add).with(1).argument }
    it 'takes a message argument and saves to instance in .all' do
      a = Peep.add("hello")
      expect(Peep.all.first).to eq(a)
    end

    # it 'instance sets date to Time.now' do
    #   a = Peep.add("hello")
    #   expect(a.time).to eq(Time.now)
    # end

    it 'instance sets text to argument' do
      a = Peep.add("hello")
      expect(a.text).to eq("hello")
    end
  end
end
