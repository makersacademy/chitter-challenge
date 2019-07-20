require 'squiggle'
require 'date'

describe Squiggle do
  let(:squiggle) { described_class.new(1,"Chip","hello",Time.now) }
  describe '#nuttify' do
    it "changes all the vowels into a nut emoji" do
      p squiggle.nuttify
      expect(squiggle.nuttify).to eq ('h🌰ll🌰')
    end
  end
end
