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
