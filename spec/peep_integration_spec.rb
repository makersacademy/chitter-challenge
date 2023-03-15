require "peep_class"
require "peep_repository_class"

RSpec.describe "integration" do 
  it "Gets all peeps that have been added" do  
  new_repo = PeepRepository.new
  peep_1 = Peep.new("morecakes", "message")
  peep_2 = Peep.new("a_user", "thoughts")
  new_repo.add(peep_1)
  new_repo.add(peep_2)
  expect(new_repo.all). to eq [peep_1, peep_2]
  end 
end 