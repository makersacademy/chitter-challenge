require './lib/peep.rb'

RSpec.describe Peep do
  let(:time_double) { DateTime }
  it "has content attribute" do 
    first_peep = Peep.create(content: 'content')
    expect(first_peep).to have_attributes(:content => 'content')
  end

  it "has time attribute" do 
    first_peep = Peep.create(created_at: time_double)
    expect(first_peep).to have_attributes(:created_at => time_double)
  end

end
