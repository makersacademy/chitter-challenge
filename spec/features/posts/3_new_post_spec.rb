require 'spec_helper'
require './spec/features/web_helpers'

feature '#new_post', %q{
  As a Maker
  So that I can let people know what I am doing
  } do

  scenario 'I want to post a message (peep) to chitter' do
    login
    expect { add_post }.to change { Post.count }.by(1)
  end
end
