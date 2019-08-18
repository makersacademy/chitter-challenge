require 'post'
require 'database_helpers'

describe Post do
  describe '.create' do
    it 'creates a new post' do
          connection = PG.connect(dbname: 'chitter_test')
          post = Post.create(msg: 'testing test', time: "test time")
          persisted_data = persisted_data(id: post.id)
          expect(post).to be_a Post

          expect(post.msg).to eq 'testing test'
          expect(post.id).to eq persisted_data.first['id']
          expect(post.time).to eq 'test time'
        end
      end

  describe '.all' do
    it 'lists posts' do
          connection = PG.connect(dbname: 'chitter_test')
          post = Post.create(msg: 'testing test', time: "test time")
          persisted_data = persisted_data(id: post.id)
          posts = Post.all

          expect(posts.first).to be_a Post
          expect(posts.first.time).to eq 'test time'
          expect(posts.first.msg).to eq 'testing test'
        end
      end
  end



# describe Post do
#
#   describe '.all' do
#     it 'returns all posts' do
#       connection = PG.connect(dbname: 'chitter_challenge_test')
#
#       post = Post.create(msg: "Im at makers", time: )
#       Post.create(msg: "http://www.destroyallsoftware.com", time: )
#       Post.create(msg: "http://www.google.com", time: )
#
#       posts = Post.all
#
#      expect(posts.length).to eq 3
#      expect(posts.first).to be_a Post
#      expect(posts.first.id).to eq post.id
#      expect(posts.first.time).to eq ''
#      expect(posts.first.msg).to eq 'Im at makers'
#     end
#   end
#
#
#   describe '.create' do
#     it 'creates a new post' do
#       connection = PG.connect(dbname: 'post_manager_test')
#       post = Bookmark.create(url: 'http://www.testpost.com', title: "test")
#
#       persisted_data = persisted_data(id: post.id)
#
#       expect(post).to be_a Bookmark
#       expect(post.url).to eq 'http://www.testpost.com'
#       expect(post.id).to eq persisted_data.first['id']
#       expect(post.title).to eq 'test'
#     end
#   end
# end
