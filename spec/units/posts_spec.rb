require 'posts'
require 'database_helper'

describe Posts do
  describe '.show_posts' do
    it 'Should return posts' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      post = Posts.create(peep_text: "I will sleep", user_name: "Matt", created_at: '2019-06-22 19:10:25-07')
      Posts.create(peep_text: "I am awake", user_name: "Jeff", created_at: '2019-04-22 20:10:25-07')
      Posts.create(peep_text: "I have eaten", user_name: "Susan", created_at: '2019-06-22 11:10:25-07')

      posts = Posts.show_posts

      expect(posts.first).to be_a Posts
      # expect(posts.first.id).to eq post.id
      # expect(post.peep_text).to include("I will sleep")
      # expect(posts).to include("I am awake")
      # expect(posts).to include("I have eaten")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      post = Posts.create(peep_text: 'My peep is created.', user_name: 'TestUser', created_at: '2019-06-22 19:10:25-07')
      # persisted_data = persisted_data(id: post.id)


      posts = Posts.show_posts
      # expect(posts).to include 'My peep is created. by TestUser'
      # expect(post).to be_a Posts
      # expect(post.id).to eq persisted_data.first['id']
      # expect(post.peep_text).to eq 'My peep is created.'
      # expect(post.user_name).to eq 'TestUser'
    end
  end

  describe '.delete' do
    it 'deletes the given peep' do
      post = Posts.create(peep_text: 'My peep is created.', user_name: 'TestUser2', created_at: '2019-06-22 19:10:25-07')
      # Posts.delete(post.id)

      # expect(Posts.show_posts.length).to eq 0
    end
  end

end
