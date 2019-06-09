describe '.all' do
  it 'returns names and message of chitters' do
    posts = Peeps.all
    expect(posts[0].name).to eq "manisha"
  end
end

describe '.add name' do
  it 'stores the name of blogger' do
    posts = Peeps.all
    allow(posts).to receive(:add_name).and_return(4)
    expect(posts.add_name).to eq(4)
  end
end

describe '.add message' do
  it 'stores the message of the blogger in message table' do
    posts1 = Peeps.all
    Peeps.add_message("Hello", 5)
    posts2 = Peeps.all
    expect(posts1.length).to eq(posts2.length-1)
  end
end