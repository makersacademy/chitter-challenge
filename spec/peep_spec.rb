require "./lib/peep.rb"

describe "peeps" do

let!(:peep) { Peep.create(text: "Hello", posted_at: Time.now)}
let!(:user) { User.create(email: "Hi@Hi.com", password: "password123", actualname: "Dave", username: "Dave1" ) }

  it "it contains a message" do
    expect(peep.text).to eq("Hello")
  end

  it "contains a time" do
    expect(peep.posted_at.strftime("%H:%M")).to eq(Time.now.strftime("%H:%M"))
  end

end
