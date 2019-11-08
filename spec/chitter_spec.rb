describe ".all" do
  it "returns a list of peeps" do
    chitter = Chitter.all

    expect(peeps_table).to include "hello"
  end
end
