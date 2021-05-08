describe Post do
  before do
    User.create(name: 'test1', email: 'test1@test.com',
      username: 'testname1', password: 'Test111')
  end

  describe '.create' do
    it 'runs query to insert post into table' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)
      created_post = DatabaseConnection.query('SELECT * FROM posts').first

      expect(post.id).to eq created_post['id']
      expect(post.time).to eq created_post['time']
      expect(post.content).to eq created_post['content']
      expect(post.user_id).to eq created_post['user_id']
    end

    it 'creates a post' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)

      expect(post.user_id).to eq '1'
      expect(post.content).to eq 'Building Chitter'
    end
  end

  describe '.all' do
    it 'returns all the posts' do
      described_class.create(content: 'Building Chitter', user_id: 1)
      described_class.create(content: 'Taking a break', user_id: 1)
      described_class.create(content: 'Writing tests', user_id: 1)

      posts = described_class.all

      expect(posts.length).to be 3
      expect(posts.map(&:content)).to include 'Building Chitter'
      expect(posts.map(&:content)).to include 'Writing tests'
    end
  end

  describe '.delete' do
    it 'deletes the post from the database' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)
      expect(Post.all).not_to be_empty

      described_class.delete(id: post.id)
      expect(Post.all).to be_empty
    end

    it 'only deletes the correct post' do
      described_class.create(content: 'Building Chitter', user_id: 1)
      described_class.create(content: 'Taking a break', user_id: 1)
      described_class.create(content: 'Writing tests', user_id: 1)

      expect(Post.all.length).to be 3

      described_class.delete(id: 2)

      expect(Post.all.length).to be 2
      expect(Post.all.map(&:content)).to include 'Building Chitter'
      expect(Post.all.map(&:content)).to include 'Writing tests'
    end
  end

  describe '.find' do
    it 'returns the post by its id' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)
      found_post = described_class.find(id: post.id)

      expect(post.id).to eq found_post.id
      expect(post.content).to eq found_post.content
      expect(post.user_id).to eq found_post.user_id
    end
  end

  describe '.update' do
    it 'updates the content of the post' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)
      content = 'This many to many relationship stuff is hard work'
      expect(described_class.find(id: post.id).content).not_to eq content

      described_class.update(id: post.id, content: content)
      expect(described_class.find(id: post.id).content).to eq content
    end
  end

  describe '.my_posts' do
    it 'returns all posts by that user' do
      user2 = User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
      described_class.create(content: 'Other post', user_id: user2.id)
      described_class.create(content: 'Another post', user_id: user2.id)

      described_class.create(content: 'Building Chitter', user_id: 1)
      described_class.create(content: 'Taking a break', user_id: 1)
      described_class.create(content: 'Writing tests', user_id: 1)

      posts = described_class.my_posts(user_id: 1)

      expect(described_class.all.length).to be 5
      expect(posts.length).to be 3
      expect(posts.map(&:content)).to include 'Building Chitter'
      expect(posts.map(&:content)).to include 'Writing tests'
      expect(posts.map(&:content)).to include 'Taking a break'
      expect(posts.map(&:content)).not_to include 'Other post'
      expect(posts.map(&:content)).not_to include 'Another post'
    end
  end

  describe '#username' do
    it 'returns username of the poster' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)
      expect(post.username).to eq 'testname1'
      expect(post.user_id).to eq '1'
    end

    it 'works with multiple users in the database' do
      User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
      User.create(name: 'test3', email: 'test3@test.com', username: 'testname3', password: 'Test333')

      post1 = described_class.create(content: 'Building Chitter', user_id: 1)
      post2 = described_class.create(content: 'Taking a break', user_id: 2)
      post3 = described_class.create(content: 'Writing tests', user_id: 3)

      expect(post1.username).to eq 'testname1'
      expect(post2.username).to eq 'testname2'
      expect(post3.username).to eq 'testname3'
    end
  end

  describe '#name' do
    it 'returns name of the poster' do
      post = described_class.create(content: 'Building Chitter', user_id: 1)
      expect(post.name).to eq 'test1'
      expect(post.user_id).to eq '1'
    end

    it 'works with multiple users in the database' do
      User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
      User.create(name: 'test3', email: 'test3@test.com', username: 'testname3', password: 'Test333')

      post1 = described_class.create(content: 'Building Chitter', user_id: 1)
      post2 = described_class.create(content: 'Taking a break', user_id: 2)
      post3 = described_class.create(content: 'Writing tests', user_id: 3)

      expect(post1.name).to eq 'test1'
      expect(post2.name).to eq 'test2'
      expect(post3.name).to eq 'test3'
    end
  end
end
