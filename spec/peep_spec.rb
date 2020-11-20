require 'peep'
require 'user'

describe Peep do
  subject{ Peep.new(1, 400, "Yeet", Time.new(2020, 8, 05, 2, 30, 0)) }

  it "Correct returns id" do
    expect(subject.id).to eq 1
  end

  it "Correctly returns user_id" do
    expect(subject.chitter_id).to eq 400
  end

  it "Correctly returns content" do
    expect(subject.content).to eq "Yeet"
  end

  it "Correctly returns time" do
    expect(subject.time.strftime("%d/%m/%Y %H:%M")).to eq("05/08/2020 02:30")
  end

  it "Adds a peep when .create is called" do
    User.create("Dumbo")
    chitter_id = User.all.first.id

    expect{ Peep.create(chitter_id, "dumb stuff", "2020/05/04", "14:37:22")}.to change { Peep.all.length }.by 1
  end

  it "Correctly returns information about peeps when .all is called" do

    User.create("Dumbo")
    chitter_id = User.all.first.id

    Peep.create(chitter_id, "Show me the money", "2020/11/20", "14:37:22")
    Peep.create(chitter_id, "You cannot handle the truth", "2019/11/20", "16:27:22")
    Peep.create(chitter_id, "Just do it", "2000/11/20", "14:37:22")

    peeps = Peep.all
    expect(peeps.length).to eq 3
    expect(peeps.first).to be_instance_of Peep
    expect(peeps.first.chitter_id).to eq(chitter_id)
    expect(peeps.first.content).to eq("Show me the money")
    expect(peeps.first.time.strftime("%Y/%m/%d %H:%M:%S")).to eq("2020/11/20 14:37:22")
  end
end
