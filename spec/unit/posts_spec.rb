require 'post'

describe 'Post' do
  describe '.all' do
    it 'shows all posts' do
      con = PG.connect :dbname => 'chitter_test'

      con.exec("INSERT INTO posts (chit) VALUES('Test chit 01');")
      con.exec("INSERT INTO posts (chit) VALUES('Test chit 02');")
      con.exec("INSERT INTO posts (chit) VALUES('Test chit 03');")

      posts = Post.all

      expect(posts).to include("Test chit 01")
      expect(posts).to include("Test chit 02")
      expect(posts).to include("Test chit 03")
    end
  end
end
