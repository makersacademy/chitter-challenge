require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  
  let(:app) { Application.new }

  context "Homepage to site /" do
    it "shows the welcome text on homepage with posts" do
      response = get('/')
    
      expect(response.status).to eq(200)
      expect(response.body).to include('<title>Welcome to Chitter Chatter!</title>')
      expect(response.body).to include('Here are the recent peeps')
      expect(response.body).to include('Here is my other post')
    end
  end

  context 'GET/register' do
    it "takes user to the register page to submit details" do
      response = get('/register')

      expect(response.status).to eq(200)
      expect(response.body).to include('<label>Enter a username:</label>')
      expect(response.body).to include('<input type="text" name="password">')
    end
  end
end
