require 'chitter'

describe Chitter do

  it 'posts a message' do
    Chitter.post("this is a test", Time.now.to_s.delete_suffix(' +0000'))
    expect(Chitter.all.last.peep).to eq("this is a test")
  end

  it 'message has a time' do
    Chitter.post("this has a time")
    expect(Chitter.all.last.time).to eq(Time.now.to_s.delete_suffix(' +0000'))
  end
end
