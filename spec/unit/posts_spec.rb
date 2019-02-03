require 'post'
require_relative '../helpers/database_helpers'

describe 'Post' do

  describe '.create' do
    it 'creates post' do
      post = Post.create(chit: 'Test chit 04')
      persisted_data = persisted_data(id: post.id)

      expect(post).to be_a Post
      expect(post.chit).to eq 'Test chit 04'
    end
  end

  describe '.all' do
    it 'shows all posts' do
      con = PG.connect :dbname => 'chitter_test'

      con.exec("INSERT INTO posts (chit, time) VALUES('Test chit 01', 'NOW()') ;")
      con.exec("INSERT INTO posts (chit, time) VALUES('Test chit 02', 'NOW()') ;")
      con.exec("INSERT INTO posts (chit, time) VALUES('Test chit 03', 'NOW()') ;")

      posts = Post.all

      expect(posts.first.chit).to eq("Test chit 01")
      expect(posts.last.chit).to eq("Test chit 03")
    end
  end
end
