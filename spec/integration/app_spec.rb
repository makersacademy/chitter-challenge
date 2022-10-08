require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'simplecov'

describe Application do
  include Rack::Test::methods
  let(:app) {Application.new}

  context "GET /" do
  it "Loads the homepgae showing peeps in reverse chronological order" do
    response = get("/")
    expect(response.status).to eq (200)
    expect(response.body).to include("<h2>
      <%= peep.content %> 
    </h2>")
  end

  context "GET /signup" do
    it "should show the sign up page" do
      response = get("/signup")
      expect(response.status).to eq(200)
      expect(response.body).to include("<label> Username:</label>")
    end  
  end

    context "POST /signup" do
      it "should show that signup is successfull" do
        response = post('/signup' id: 5, username: "BlackP", password: "king")
        expect(response.status).to eq(200)
        expect(response.body).to eq('')
        
        response = get("/signup")
        expect(response.body).to include("<label> Username:</label>")
      end
    end
end
