require "spec_helper"
require 'bcrypt'
require_relative '../../app'
require './models/user'
require './models/post'

describe "Chitter" do
  include Rack::Test::Methods
  let(:app) { Application.new }

  before do
    DatabaseCleaner.clean_with(:truncation)
    load "./db/seeds.rb"
  end


  it 'should post a peep' do
    response = post '/peeps', params = {message: "test peep"}
    expect(response.status).to eq 302
    expect { response.should redirect_to('/') }
    expect(Post.all.count).to eq 4
    expect(response.body).to include('test peep')
  end

  it 'should not post a peep if longer than 140 characters' do
    string = "a" * 141
    response = post '/peeps', params = {message: string}
    expect(response.status).to eq 200
    expect { response.should redirect_to('/') }
    expect(Post.all.count).to eq 3
  end

  it 'should stop sql injections through peeps' do
    response = post '/peeps', params = {message: "test peep'; DROP TABLE users;"}
    expect(response.status).to eq 302
    expect { response.should redirect_to('/') }
    expect(Post.all.count).to eq 4
    expect(response.body).to include('test peep')
  end

  it 'should display peeps' do
    response = get '/'
    expect(response.status).to eq 200
    expect(response.body).to include('content1')
    expect(@peeps.count).to eq 3
    expect(response).to be_ok
  end

end