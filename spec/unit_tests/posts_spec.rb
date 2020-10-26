require 'sinatra/base'
require './lib/posts'

describe Posts do
  describe '.print_all' do
    it 'returns all posts' do
      posts = Posts.print_all

      expect(posts).to include("Anyone trying to get into coding should check out makersacademy.com")
      expect(posts).to include("Top 10 tracks and videos of all time https://www.youtube.com/watch?v=HldHtBxNK6k")
      expect(posts).to include("Anyone got any good otter pics?")
    end
  end
end