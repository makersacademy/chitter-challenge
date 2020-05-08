require 'maker.rb'
require 'spec_helper'


RSpec.describe Maker do
  describe '.all' do
    context 'it shows a list of peeps' do
      it 'enables user to view list of peeps in chronological order' do
        #for this test to work, I would need to implement the signin database here too - so the username can be included.
        #Therefore, more aspects need to be done before this test will pass.
        maker = Maker.create_peep(peep: "I went on a walk", datetime: "08/05/2020")
        maker = Maker.create_peep(peep: "I went on a walk again", datetime: "09/05/2020")
        maker = Maker.all
        expect(maker.first.peep).to eq "I went on a walk again"
      end
    end
  end
end
