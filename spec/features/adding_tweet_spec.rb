require 'spec_helper'

feature "User adds a new tweet" do
  scenario "when browsing the homepage" do
    expect(Tweet.count).to eq(0)
    visit '/'
    add_tweet("Hello, this is my first tweet", "Sebastien")
    expect(Tweet.count).to eq(1)
    tweet = Tweet.first
    expect(tweet.message).to eq("Hello, this is my first tweet")
    expect(tweet.user).to eq("Sebastien")
  end

  def add_tweet(message, user)
    within('#new-tweet') do
      fill_in 'message', :with => message
      fill_in 'user', :with => user
      click_button 'Send tweet'
    end
  end
end