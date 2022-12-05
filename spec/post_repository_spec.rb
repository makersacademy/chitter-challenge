require 'post'
require 'post_repository'
require 'database_connection'

def reset_posts_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  context "All posts" do
    it "lists all the posts in chitter" do
        repo = PostRepository.new
        posts = repo.all

        expect(posts.length).to eq 4

        expect(posts[0].id).to eq 1
        expect(posts[0].title).to eq 'Antidotes'
        expect(posts[0].content).to eq 'math rocking glory'
        expect(posts[0].time).to eq '2008-01-01 12:00:00'

        expect(posts[1].id).to eq 2
        expect(posts[1].title).to eq 'TLF'
        expect(posts[1].content).to eq 'spanish sahara left field'
        expect(posts[1].time).to eq '2010-01-01 12:00:00'
    end
  end

  context "Finds posts" do
    it "finds the post at index 3" do
        repo = PostRepository.new
        post = repo.find(3)

        expect(post.id).to eq 3
        expect(post.title).to eq 'Holy Fire'
        expect(post.content).to eq 'you dont have my number'
        expect(post.time).to eq '2013-01-01 12:00:00'
    end
  end

  context "Creates posts" do
    it "creates a new post" do
        repo = PostRepository.new
        post = Post.new

        post.title = 'Life Is Yours'
        post.content = 'wake me up'
        post.time = '2022-01-01 12:00:00'

        repo.create(post)

        posts = repo.all
        last_post = posts.last
        expect(last_post.title).to eq 'Life Is Yours'
        expect(last_post.content).to eq 'wake me up'
        expect(last_post.time).to eq '2022-01-01 12:00:00'
    end
  end
end