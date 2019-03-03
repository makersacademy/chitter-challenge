require "chitter"

describe Chitter do
  it "lists all peeps" do
    Chitter.list
  end

  it "Posts a new peep" do
    Chitter.post("My gift is my peep, and this one's for you")
  end
end
