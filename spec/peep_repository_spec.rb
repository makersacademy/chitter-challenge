require "peep_repository"
require "shared_context_spec"

describe PeepRepository do

  include_context "doubles setup"

  before { reset_peeps_table } 

  context "#all method" do
    it "should return a list of all peeps" do
      result = subject.all
      expect(result.length).to eq 3
    end
    it "should return all peeps in a reverse chronolical order" do
      result = subject.all
      expect(result.first.time).to eq('2023-03-09 16:45:54.912033')
      expect(result[1].time).to eq('2023-03-09 16:35:54.912033')
      expect(result.last.time).to eq('2023-03-09 16:32:54.912033')
    end
  end
end