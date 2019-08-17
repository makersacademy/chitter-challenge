require 'post'
require 'database_helpers'

describe Post do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'chitter_challenge_test')

      post = Post.create(msg: "http://www.makersacademy.com", time: )
      Post.create(msg: "http://www.destroyallsoftware.com", time: )
      Post.create(msg: "http://www.google.com", time: )

      posts = Post.all

     expect(posts.length).to eq 3
     expect(posts.first).to be_a Post
     expect(posts.first.id).to eq post.id
     expect(posts.first.time).to eq 'Makers Academy'
     expect(posts.first.msg).to eq 'http://www.makersacademy.com'
    end
  end


  describe '.create' do
    it 'creates a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: "test")

      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'test'
    end
  end
end
