require "spec_helper"
require 'bcrypt'
require_relative '../../app'
require './models/user'
require './models/post'
# write test with capybara for sign_up
describe "Chitter" do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before do
    DatabaseCleaner.clean_with(:truncation)
    load "./db/seeds.rb"
  end

  it "should access the sign up page" do
    response = get '/users/new'
    expect(response.status).to eq 200
    expect(response.body).to include('Welcome, Sign up to Chitter here!')
    expect(response).to be_ok
  end

  it "should allow a user to sign up" do
    response = post '/sign_up', params = {name: "test3", username: "test3", email: "test3@test3.com", password: "test"}
    expect(response.status).to eq 302
    user = User.find_by(email: "test3@test3.com")
    expect(user.name).to eq "test3"
    response = get '/'
    expect(response.body).to include('Welcome, test3')
  end
end