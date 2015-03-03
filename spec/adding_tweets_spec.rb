require 'spec_helper'

feature "User adds a new tweet" do
  scenario "when browsing the homepage" do
    expect(Tweet.count).to eq(0)
    visit '/'
    add_tweet("Hello, world", "Sean")
    expect(Tweet.count).to eq(1)
    tweet = Tweet.first
    expect(tweet.post).to eq("Hello, world")
    expect(tweet.user).to eq("Sean")
  end

  def add_tweet(post, user)
    within('#new-tweet') do
      fill_in 'post', :with => post
      fill_in 'user', :with => user
      click_button 'Add tweet'
    end
  end
end