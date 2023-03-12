require "peep_repository"
require "shared_context_spec"

describe PeepRepository do

  include_context "doubles setup"

  before { reset_peeps_table } 

  context ".all method" do
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
  context ".create method" do
    it "should add a new peep to the database" do
      peep = Peep.new
      peep.time = '2023-03-12 11:49:54.912033'
      peep.content = 'Happy sunday everyone!'
      peep.user_id = 2
      subject.create(peep)
      result = subject.all

      expect(result.length).to eq 4
      expect(result.first.time).to eq '2023-03-12 11:49:54.912033'
      expect(result.first.content).to eq 'Happy sunday everyone!'
      expect(result.first.user_id).to eq 2
    end
    it "should get the tags of the new peep" do
      peep = Peep.new
      peep.time = '2023-03-12 11:49:54.912033'
      peep.content = 'Happy sunday! @changwynn @mrbike'
      peep.user_id = 2
      expect(Peep).to receive(:get_tags)
                  .with(peep.content)
                  .and_return(["changwynn", "mrbike"])
      subject.create(peep)
    end
  end
end