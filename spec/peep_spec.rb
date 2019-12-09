
describe Peep do
  it "Can list peeps in reverse chronological order" do
    
  end

  it "Must be logged in" do
    expect(subject.new(content: "word", user: "Dogstrong")).to raise_error

  end
end
