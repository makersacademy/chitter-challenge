# Unit tests for the Wall class in the model (lib)

require 'wall'
require './spec/web_helpers'
require 'pg'

describe Wall do

  before(:each) do
    setup_tables
  end

  it '- creates an array of posts in reverse chronological order' do
    expect(Wall.return_all[0].content[:post]).to eq "Post from 2019-12-02 @ 10:00"
    expect(Wall.return_all[1].content[:post]).to eq "Post from 2019-12-02 @ 08:00"
    expect(Wall.return_all[2].content[:post]).to eq "Post from 2019-11-17 @ 10:00"
    expect(Wall.return_all[3].content[:post]).to eq "Post from 2019-08-16 @ 10:00"
  end

end
