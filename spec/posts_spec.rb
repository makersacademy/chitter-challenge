require 'posts.rb'

describe Posts do

  describe 'show' do
    it 'returns an entry from the database' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO posts (name, message) VALUES ('Tom','test message');")

      post = Posts.show

      expect(post.first.name).to eq 'Tom'
      expect(post.first.message).to eq 'test message'
    end
  end

  describe 'create' do
    it 'posts a message on the homepage' do
      Posts.create(name: 'Sam', message: 'I am busy')
      post = Posts.show

      expect(post[0].name).to eq 'Sam'
      expect(post[0].message).to eq 'I am busy'
    end
  end

end
