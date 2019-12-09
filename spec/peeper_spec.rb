describe Peeper do
  before(:each) do
    @peeper = Peeper.new(name: "bill", email: "Bill@gmail.com", password: "???", user: "Doggstrong", peep: nil)
  end
  it "Can produce peeps" do
    hello_world = "Hello world!"
    expect(@peeper.peep(hello_world)).to eq "Hello world!"
  end


end
