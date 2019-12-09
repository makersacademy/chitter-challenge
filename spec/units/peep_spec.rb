require 'models/peep'
require 'pg'

describe Peep do
  it "should be able to list the peeps table in reverse order" do
    add_to_peeps content: "This is a test peep", time: Time.now.utc - 10
    add_to_peeps content: "This is a second one", time: Time.now.utc

    peeps = Peep.all.order created_at: :desc

    expect(peeps.size).to eq 2
    expect(peeps.first.content).to eq "This is a second one"
  end

  it "should be able to create a peep" do
    Peep.create(user_id: 1, content: "Creating a test peep")

    peeps = Peep.all

    expect(peeps.size).to eq 1
    expect(peeps.first.content).to eq "Creating a test peep"
    expect(peeps.first.user_id).to eq 1
  end
end
