require "peep_repository_class"

RSpec.describe PeepRepository do 
  it "initally returns an empty library" do
    new_repo = PeepRepository.new
    expect(new_repo.all).to eq []
  end 
end 