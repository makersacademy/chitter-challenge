require_relative '../models/post'
require_relative '../repositories/post_repository'

def reset_tables
  seed_sql = File.read('db/seeds.sql')
  connection = PG.connect({ host: 'localhost', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_tables
  end

  describe "#all" do
    it "returns all records" do
      repo = PostRepository.new

      expected = [
        have_attributes(
          id: 1,
          content: 'My first post',
          timestamp: Time.new(2023, 1, 31, 10, 10, 10),
          user_id: 1
        ),
        have_attributes(
          id: 2,
          content: 'Just joined',
          timestamp: Time.new(2023, 2, 1, 14, 40, 55),
          user_id: 2
        ),
        have_attributes(
          id: 3,
          content: 'Hi Bob',
          timestamp: Time.new(2023, 2, 1, 14, 45, 20),
          user_id: 1
        ),
        have_attributes(
          id: 4,
          content: 'Hello you two',
          timestamp: Time.new(2023, 2, 2, 8, 32, 1),
          user_id: 3
        )
      ]

      expect(repo.all).to match_array(expected)
    end
  end

  describe "#all_with_user" do
    it "returns all records" do
      repo = PostRepository.new

      expected = [
        have_attributes(
          id: 1,
          content: 'My first post',
          timestamp: Time.new(2023, 1, 31, 10, 10, 10),
          user_id: 1,
          name: 'Alice',
          username: 'aliceinwonderland'
        ),
        have_attributes(
          id: 2,
          content: 'Just joined',
          timestamp: Time.new(2023, 2, 1, 14, 40, 55),
          user_id: 2,
          name: 'Bob',
          username: 'bobthebuilder'
        ),
        have_attributes(
          id: 3,
          content: 'Hi Bob',
          timestamp: Time.new(2023, 2, 1, 14, 45, 20),
          user_id: 1,
          name: 'Alice',
          username: 'aliceinwonderland'
        ),
        have_attributes(
          id: 4,
          content: 'Hello you two',
          timestamp: Time.new(2023, 2, 2, 8, 32, 1),
          user_id: 3,
          name: 'Carol',
          username: 'carolsinging'
        )
      ]

      expect(repo.all_with_user).to match_array(expected)
    end
  end

  describe "#create" do
    it "creates a record" do
      repo = PostRepository.new
      new_post = Post.new(content: 'Test post', timestamp: Time.new(2023, 2, 1, 14, 45, 20), user_id: 1)

      repo.create(new_post)

      expected = have_attributes(new_post.to_h.except(:id))

      expect(repo.all).to include(expected)
    end
  end
end
