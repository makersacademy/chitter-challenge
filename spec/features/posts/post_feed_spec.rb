require 'spec_helper'
require './spec/features/web_helpers'

feature '#post_feed', %q{
  As a maker
  So that I can see what others are saying
} do

  scenario 'I want to see all cheeps in reverse chronological order' do
    signup
    login
    add_post
    add_another_post
    expect('Another post').to appear_before('Test post')
  end
end

feature '#post_timestamp', %q{
  As a maker
  So that I can better appreciate the context of a peep
} do

  scenario 'I want to see the time at which it was made' do
    signup
    login
    add_post
    post_time = Post.first.created_at.strftime('%d/%m/%Y %I:%M%p').to_s
    expect(post_time).to include(Time.now.strftime('%d/%m/%Y %I:%M%p').to_s)
  end
end
