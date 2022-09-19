require './models/user'
require './models/post'

describe User do
  before do
    DatabaseCleaner.clean_with(:truncation)
    load "./db/seeds.rb"
  end
  it 'should be able to sign up' do
    user = User.create(name: 'test3', username: 'test3', email: 'test3@test.com', password: 'password')
    expect(user.username).to eq 'test3'
    expect(User.all.count).to eq 3
  end
  it 'should be able to find a user by username' do
    user = User.find_by(username: 'test1')
    expect(user.name).to eq 'test1'
  end
  it 'should be able to update a user' do
    user = User.find_by(username: 'test1')
    user.update(name: 'test4')
    expect(user.name).to eq 'test4'
  end
  it 'should be able to delete a user' do
    user = User.find_by(username: 'test1').destroy
    expect(User.all.length).to eq 1
    posts = Post.all
    expect(posts.length).to eq 1
  end
  
end