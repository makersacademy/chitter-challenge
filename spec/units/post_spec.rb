require 'spec_helper'
require './app/models/post'

describe Post do

  context "when I manually create a new post" do
    it "the post count should go up by 1" do
      # @post = Post.create(content: "testTESTtest123_456_789_0_987_654_321testTESTtest", timestamp: Time.now)
      @user = create_test_user
      expect{@user.posts.create(content: "testTESTtest123_456_789_0_987_654_321testTESTtest", timestamp: Time.now)}.to change{Post.count}.by(+1)
    end
  end
end
