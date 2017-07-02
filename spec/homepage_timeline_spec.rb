require 'spec_helper.rb'
require 'web_helper'

describe "Homepage" do
  feature "Diplays welcome" do
    scenario "Upon logon, prompt user to enter message" do
    visit ('/')
    expect(page).to have_content 'Make a tweep'
    end
 end

  feature "posts a tweet" do
    scenario "User makes way to form, inputs text, clicks button" do
      post_tweet
      expect(page).to have_content('Test message')
    end
  end

  feature "shows the timetamp" do
    scenario "User makes way to form, inputs tweet" do
    post_tweet
    expect(page).to have_content('2017')
    end
  end
end
