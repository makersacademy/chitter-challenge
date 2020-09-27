require 'chitter'
require 'database_helpers'

describe Chitter do

  before(:each) do
  #@example_time = Time.new
  #@formatted_time = @example_time.strftime("%k:%M")
  #allow(Time).to receive(:new) {@example_time}
  add_user
  
end

describe '#add' do
  it 'adds a tweet' do
    
    Chitter.add(tweet:"What!?", username:"test")
    expect(tweet.tweet).to eq("What!?")
  end
end
describe '#show' do
  it 'returns a list of tweets' do

    expect(tweet.tweet).to include("What!?")
  end
end
end