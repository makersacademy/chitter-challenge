require "peep_class"

RSpec.describe Peep do 
  it "Creates a peep with a username and message" do 
    peep_1 = Peep.new("user", "opinions")
    
    expect(peep_1.username).to eq "user"
    expect(peep_1.message).to eq "opinions"
  end 

  xit "Returns the time and date that a peep was submitted" do 
    peep_1 = Peep.new("Barry_the_Builder", "These are my opinions")
    expect(peep.time_added).to eq #=> a time the peep_1 was initialized
  end 

  xit "Returns error message if one of the parameters is empty string" do
    peep_1 = Peep.new("Barry_the_Builder", "")
    expect(peep_1) #=> error message - content must be entered 
  end

  xit "Returns error message if one of the parameters is empty string (2)" do 
    peep_1 = Peep.new("", "Today I passed my exams")
    expect(peep_1) #=> error message - username must be entered 
  end 

end 