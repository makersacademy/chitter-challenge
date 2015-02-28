require 'spec_helper'
require './app/helpers/sessions'

include SessionHelpers

feature 'User can only send a tweet when signed in' do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "with correct credentials" do
    visit '/'
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Message:")
    expect(Tweet.count).to eq(0)
    visit '/'
    add_tweet("Hello, this is my first tweet", "Sebastien")
    expect(Tweet.count).to eq(1)
    tweet = Tweet.first
    expect(tweet.message).to eq("Hello, this is my first tweet")
    expect(tweet.user).to eq("Sebastien")
  end
end


  def add_tweet(message, user)
    within('#new-tweet') do
      fill_in 'message', :with => message
      fill_in 'user', :with => user
      click_button 'Send tweet'
    end
  end