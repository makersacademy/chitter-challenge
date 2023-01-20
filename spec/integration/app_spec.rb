require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET /" do 
    it "returns a 200 ok response" do 
      response = get('/')
      expect(response.status).to eq 200
    end

    it "returns the index view" do
      response = get('/')
      expect(response.body).to include('<input type="submit" value="Sign Up!">')
    end
  end 

  context "GET /sign_up" do
    it "returns a 200 ok response" do 
        response = get('/sign_up')
        expect(response.status).to eq 200
    end
    it "returns the sign-up view" do 
        response = get('/sign_up')
        expect(response.body).to include('<h1> Sign up to Chitter </h1>')
    end
  end

end
