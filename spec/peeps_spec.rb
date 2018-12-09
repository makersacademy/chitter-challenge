require "peeps"
describe Peep do
  let(:user) {double :user, username: "test_user"}
  it "user can set body variable by argument - 'hello'" do
    peep = Peep.new("hello", "user", "Friday")
    expect(peep.body).to eq "hello"
  end
  it "user can set username variable by argument - 'user'" do
    peep = Peep.new("hello", "user", "Friday")
    expect(peep.username).to eq "user"
  end
  it "user can set username variable by argument - 'Friday'" do
    peep = Peep.new("hello", "user", "Friday")
    expect(peep.timestamp).to eq "Friday"
  end
  it "finds user by username" do
    peep = Peep.new("hello", "test", "Friday")
    expect(peep.find_user.username).to eq "test"
  end
  it "creates a peep" do
    expect(Peep.create("hello", "test").body).to eq "hello"
  end
  it "gets all peeps" do
    expect(Peep.all[0].body).to eq "hello test"
    expect(Peep.all[0].username).to eq "test"
    expect(Peep.all[0].timestamp.empty?).to eq false
    expect(Peep.all[1].body).to eq "goodbye test"
    expect(Peep.all[1].username).to eq "test"
    expect(Peep.all[0].timestamp.empty?).to eq false
    expect(Peep.all[2].body).to eq "hello real"
    expect(Peep.all[2].username).to eq "real"
    expect(Peep.all[2].timestamp.empty?).to eq false
    expect(Peep.all[3].body).to eq "goodbye real"
    expect(Peep.all[3].username).to eq "real"
    expect(Peep.all[3].timestamp.empty?).to eq false
  end
  it "gets all peeps in reverse chronological order" do
    reverse_peeps = Peep.reverse_time_peeps
    expect(reverse_peeps.first.timestamp).to eq Peep.all.last.timestamp
    expect(reverse_peeps.last.timestamp).to eq Peep.all.first.timestamp
  end
end
