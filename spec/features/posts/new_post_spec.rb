require 'spec_helper'
require './spec/features/web_helpers'

feature '#new_post', %q{
  As a Maker
  So that I can let people know what I am doing
  } do

  scenario 'I want to post a message (cheep) to chitter' do
    signup
    login
    expect { add_post }.to change { Post.count }.by(1)
  end

  scenario '&& the new message should be displayed on the homepage' do
    signup
    login
    add_post
    expect(page).to have_content('Test post')
  end

  scenario '&& the displayed message should include name' do
    signup
    login
    add_post
    expect(page).to have_content('foobar')
  end

  scenario '&& the displayed message should include username with an @' do
    signup
    login
    add_post
    expect(page).to have_content('@foo')
  end
end
