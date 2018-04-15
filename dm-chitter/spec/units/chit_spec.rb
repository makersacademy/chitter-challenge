require 'chitter'

describe "Chit" do

  subject(:chit) {Chit.new("I like bagels")}

  it "takes in the content of a tweet as an argument" do
    tweet = "I like bagels"
    expect(chit.post).to eq tweet
  end

  it "sets creates the time of the tweet by default" do
    time = Time.now.asctime
    expect(chit.time).to eq time
  end

end
    

  