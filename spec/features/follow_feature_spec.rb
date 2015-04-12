require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peep_helper'
require_relative 'helpers/follow_helper'

include SessionHelpers
include PeepHelpers
include FollowHelpers

feature 'A user really interested to someone posts' do
  before do
    sign_up
    peep_log_out
    john_signs_up
    log_in("john89", "password")
  end

  scenario 'can follow him' do
    expect { follow }.to change(Follow, :count).by 1
  end

  scenario 'can view just the posts of the person who is following' do
    follow
    click_link 'Followed'
    expect(page).to have_content("this is a peep")
  end

  scenario 'can know how many people he is following' do
    follow
    expect(page.find('.navbar')).to have_content 'Following 1'
  end

  scenario 'can view a list of the people who follows' do
    follow
    click_link 'Following 1'
    expect(page).to have_content 'bob89'
  end
end

feature 'A user is no long interested to someone posts' do
  before do
    sign_up
    peep_log_out
    john_signs_up
    log_in("john89", "password")
  end

  scenario 'can unfollow him' do
    follow
    expect { unfollow }.to change(Follow, :count).by(-1)
  end
end

feature 'A very popular user' do
  before do
    sign_up
    peep_log_out
    john_signs_up
    log_in("john89", "password")
    follow
    click_link 'Log out'
    log_in("bob89", "password")
  end

  it 'can know how many people are following him' do
    expect(page.find('.navbar')).to have_content 'Followers 1'
  end

  it 'can view a list of the people who are following him' do
    click_link 'Followers 1'
    expect(page).to have_content 'john89'
  end

end
