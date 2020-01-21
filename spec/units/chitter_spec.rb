describe Chitter do
  it 'can retrieve items from the database' do
    # call database and retrieve latest entry in database
    test_post = Chitter.all.first
    # checking info is correct
    expect(test_post.peep).to eq('test post')
  end

  it 'should be able to post a peep' do
    # call the post peep method
    Chitter.post('new post')
    # retrieve this post from db
    new_post = Chitter.all.last
    # check details are correct
    expect(new_post.peep).to eq('new post')
  end

  it 'should have a timestamp' do
    Chitter.post('Time')
    new_post = Chitter.all.last
    expect(new_post.created_at).to be_kind_of DateTime
  end
end
