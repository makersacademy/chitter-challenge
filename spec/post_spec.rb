require 'post'
require 'reset_tables'

RSpec.describe Post do
  before(:each) do 
    reset = ResetTables.new
    reset.reset_posts_table
  end

  it 'return all posts from the database' do
    expect(Post.all_peeps[0]).to include("Hey howre you doing")
  end

  it 'creates a new post and returns the table' do
    Post.create_post(Time.now, 'Its Friday', 2)
    expect(Post.all_peeps[-1]).to include("Its Friday")
  end
end
