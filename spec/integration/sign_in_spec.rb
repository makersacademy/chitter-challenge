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

  it "should access the login page" do
    response = get '/sessions/new'
    expect(response.status).to eq 200
    expect(response.body).to include('Login to Chitter!')
    expect(response).to be_ok
  end

  it "should allow a user to sign in" do
    response = post '/sessions/login', params = {email: "test1@test1.com", password: "password"}
    expect(response.status).to eq 302
    expect { response.should redirect_to('/') }
    response = get '/'
    expect(response.body).to include('Welcome, test1')
  end

  it "should not allow a user to sign in with incorrect password" do
    response = post '/sessions/login', params = {email: "test1@test1.com", password: "wrong"}
    expect(response.status).to eq 200
    expect { response.should redirect_to('/session/new') }
    expect(response.body).to include('Incorrect email or password')
  end

  it 'should log out a user' do
    response = get '/sessions/logout'
    expect(response.status).to eq 302
    expect { response.should redirect_to('/') }
    response = get '/'
    expect(response.body).not_to include('Welcome, test1')
  end

end