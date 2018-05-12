require 'pg'
require 'spec_helper'

describe Peep do

  describe '.all' do
    it 'should return all peeps' do

      peep_1 = Peep.create(:content => "Hello World", :username => "First the worst", :created_at => Time.now)
      peep_2 = Peep.create(:content => "Second Peep", :username => "Second the best", :created_at => Time.now)
      peep_3 = Peep.create(:content => "Peep Peep", :username => "Peeping Tom", :created_at => Time.now)

      expect(Peep.all).to include peep_1
      expect(Peep.all).to include peep_2
      expect(Peep.all).to include peep_3

    end
  end

end
