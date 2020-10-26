describe Peep do
  before :each do
    User.create(username: "ds.danielh")
    Peep.create(content: "Test post", poster_id: 1)
  end
  it "can retreive content using an Object Relational Mapper" do
    expect(Peep.find(1).content).to eq "Test post"
  end

  it "stores the time a peep was created" do
    created_at = Peep.find(1).created_at
    expect(created_at.to_date).to eq Date.today
  end

  it "can find the username of the user who posted it" do
    peep = Peep.find(1)
    expect(peep.username).to eq "ds.danielh"
  end
end
