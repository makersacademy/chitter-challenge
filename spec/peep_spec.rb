require 'peep'
require 'user' # in database user id is a linked field so we need to test with user class

describe Peep do
  subject { Peep.new(1, 420, "Dabs", Time.new(2020, 04, 20, 4, 20, 0)) }

  it "Correctly returns id" do
    expect(subject.id).to eq(1)
  end

  it "Correctly returns user_id" do
    expect(subject.user_id).to eq(420)
  end

  it "Correctly returns content" do
    expect(subject.content).to eq("Dabs")
  end

  it "Correctly returns time" do
    expect(subject.time.strftime("%Y/%m/%d %H:%M:%S")).to eq("2020/04/20 04:20:00")
  end

  it "Adds a peep when .create called" do
    # User created so that a valid user id can be supplied to the psql database
    User.create("Dumbo")
    user_id = User.all.first.id

    expect { Peep.create(user_id, "dumb stuff", "2020/05/04", "14:37:22") }.to change { Peep.all.length }.by(1)
  end

  it "Correctly returns information about peeps when .all called" do
    # User created so that a valid user id can be supplied to the psql database
    User.create("Dumbo")
    user_id = User.all.first.id

    # Creating several peeps to test
    Peep.create(user_id, "Donny T won the election", "2020/11/20", "14:37:22")
    Peep.create(user_id, "Kanye won the election", "2020/11/20", "15:37:22")
    Peep.create(user_id, "Bernie won the election", "2020/11/20", "16:37:22")

    # Expectations
    peeps = Peep.all
    expect(peeps.length).to eq(3)
    expect(peeps.first).to be_instance_of(Peep)
    expect(peeps.first.user_id).to eq(user_id)
    expect(peeps.first.content).to eq("Donny T won the election")
    expect(peeps.first.time.strftime("%Y/%m/%d %H:%M:%S")).to eq("2020/11/20 14:37:22")
  end

end
