require 'peep'
require 'pg'
require 'spec_helper'

describe Peep do

  describe '.all' do
    it 'should return all peeps' do

      peep_1 = Peep.create(:content => "Hello World", :username => "First the worst")
      peep_2 = Peep.create(:content => "Second Peep", :username => "Second the best")
      peep_3 = Peep.create(:content => "Peep Peep", :username => "Peeping Tom")

      expect(Peep.all).to include peep_1
      expect(Peep.all).to include peep_2

    end
  end

end
