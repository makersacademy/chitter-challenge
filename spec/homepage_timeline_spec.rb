require 'spec_helper.rb'
require 'web_helper'

describe "Homepage" do
  feature "Diplays welcome" do
    scenario "Upon sign up or site access, prompt user to tweet" do
    visit '/'
    expect(page).to have_content 'Make a tweet'
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
