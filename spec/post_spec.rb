require_relative '../lib/post'

describe Post do
  describe '.all' do
    it 'returns all posts' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO post (content) VALUES('My first Peep');")
      connection.exec("INSERT INTO post (content) VALUES('My second Peep');")

      post = Post.all

      expect(post).to include("My first Peep")
      expect(post).to include("My second Peep")
    end
  end

  describe '.create' do
    it 'creates a new post' do
    end
  end
end
