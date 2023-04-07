require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  
  let(:app) { Application.new }

  context "Homepage to site /" do
    it "shows the homepage with options" do
      response = get('/')
    
      expect(response.status).to eq(200)
      expect(response.body).to include('<title>Welcome to Chitter Chatter!</title>')
      expect(response.body).to include('Here are your posts:')
    end
  end
end
