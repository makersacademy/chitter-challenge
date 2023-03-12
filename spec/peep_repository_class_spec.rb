require "peep_repository_class"

RSpec.describe PeepRepository do 
  it "initally returns an empty library" do
    new_repo = PeepRepository.new
    expect(new_repo.all).to eq []
  end 

  it "Gets all peeps that have been added (2)" do 
    new_repo = PeepRepository.new
    peep_1 = Peep.new("morecakes", "message")
    peep_2 = Peep.new("morecakes", "message")
    new_repo.add(peep_1)
    
    expect(new_repo.all).to eq [peep_1]

  end 
end 