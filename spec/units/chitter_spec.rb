describe Chitter do
  it 'can retrieve items from the database' do
    # call database and retrieve latest entry in database
    test_post = Chitter.all.first
    # checking info is correct
    expect(test_post).to eq('test post')
  end

  it 'should be able to post a peep' do
    # call the post peep method
    Chitter.post('new post')
    # retrieve this post from db
    new_post = Chitter.all.last
    # check details are correct
    expect(new_post).to eq('new post')
  end
end
