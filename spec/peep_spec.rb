require "peep"

RSpec.describe "Peeps" do
  it "creates a peep" do
    peep = Peep.create(post: "This a testing peep", user_id: 1)
    expect(peep.post).to eq "This a testing peep"
  end
end
