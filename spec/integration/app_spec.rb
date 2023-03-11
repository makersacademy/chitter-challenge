require "spec_helper"
require "rack/test"
require "shared_context_spec"
require_relative "../../app"

describe Application do

  include Rack::Test::Methods
  
  let(:app) { Application.new }
  
  include_context "doubles setup"
  before { reset_users_table }
  before { reset_peeps_table }

  context "GET /" do
    it "should return 200 OK" do
      response = get '/'
      expect(response.status).to eq 200
    end
    it "should return a message when there is no peeps in the table" do
      allow_any_instance_of(PeepRepository).to receive(:all) { [] }
      response = get '/'
      expect(response.body).to include("It looks like there is no peeps around")
    end
    it "should all peeps from repository in a reverse chonological orders" do
      response = get '/'
      newest = '<p>@jdoe @changwynn guys, Have you watched the game yesterday?</p>'
      oldest = '<p>How are you guys doing, today? @jdoe @mrbike</p>'
      regexp = /.*#{Regexp.escape(newest)}.*#{Regexp.escape(oldest)}.*/m
      expect(last_response.body).to include(newest)
      expect(last_response.body).to match(regexp)
    end
  end
  context "POST /find_user" do
    context "search for a user by username"
    it "should redirect to the public page of a user given a username" do
      response = post '/find_user', search: "changwynn"
      follow_redirect!
      expect(last_response.status).to eq 200
      expect(last_request.path).to eq "/user/changwynn"
      expect(last_response.body).to include "<h1>changwynn</h1>"
    end
    context "search for a user by email"
    it "should redirect to the public page of a user given an email adress" do
      response = post '/find_user', search: "mike.bike@live.com"
      follow_redirect!
      expect(last_response.status).to eq 200
      expect(last_request.path).to eq "/user/mrbike"
      expect(last_response.body).to include "<h1>mrbike</h1>"
    end
  end
end