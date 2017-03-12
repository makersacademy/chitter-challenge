require './app/models/peep'

describe Peep do

  it "Is created with the Date and Time of posting" do
    time = Time.new(2017,03,12,8,37)
    peep = Peep.create(message: "Just ate some yummy noodles", created_at: time)
    expect(peep.created_at.strftime("%d/%m/%Y at %I:%M%p")).to eq("12/03/2017 at 08:37AM")
  end

end
