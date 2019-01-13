require "./lib/peep.rb"

describe "peeps" do
  it "it exists" do
    p = Peep.create(text: "Hello")
    expect(p.text).to eq("Hello")
  end

  it "contains a time" do
    p = Peep.create(text: "Hello")
    expect(p.posted_at.strftime("%H:%M")).to eq(Time.now.strftime("%H:%M"))
  end

end
