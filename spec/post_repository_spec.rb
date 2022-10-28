require 'post'
require 'post_repository'

def reset_posts_table
    seed_sql = File.read('spec/seeds/post_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
end

describe PostRepository do
    before(:each) do
        reset_posts_table
    end

    it "returns all posts" do
        repo = PostRepository.new
        result = repo.all
        expect(result.length).to eq 6
    end

    it "creates a post" do
        repo = PostRepository.new
        new_post = Post.new
        new_post.content = 'Hulk, smash!'
        new_post.date = Time.now
        new_post.user_id = 4
        repo.create(new_post)
        result = repo.all
        expect(result.length).to eq(7)
    end
end