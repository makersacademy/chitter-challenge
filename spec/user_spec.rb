require 'user'
require_relative './insert_user_known_id'

describe User do
  subject { User.new(1, "test") }

  it "Correctly returns id" do
    expect(subject.id).to eq(1)
  end

  it "Correctly returns username" do
    expect(subject.username).to eq("test")
  end

  it "Creates a user correctly" do
    expect { User.create("Dumbo") }.to change { User.all.length }.by(1)
  end

  it "Returns correct array of user objects" do
    User.create("Dumbo")
    User.create("Mickey")
    User.create("Pinochio")

    user_array = User.all

    expect(user_array.length).to eq(3)
    expect(user_array.first).to be_instance_of(User)
    expect(user_array.first.username).to eq("Dumbo")
  end

  it "Can correctly return the username when given the id" do
    insert_user_known_id
    expect(User.username_by_id(999)).to eq("Testerson")
  end

end
