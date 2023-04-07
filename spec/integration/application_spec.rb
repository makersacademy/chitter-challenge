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
      expect(response.body).to include('<input type="text" name="password" required>')
    end
  end

  context 'POST /' do
    it 'should validate register parameters' do
      response = post(
        '/register',
        email_addres: '',
        username: 'tina_fake',
        password: 123)

        expect(response.status).to eq(400)
    end

    it "registers a new user" do
      response = post('/register',
      email_address: 'ricky@fake.com',
      username: 'ricky_fake',
      password: 'rickyfake1234')

      expect(response.status).to eq(302)
    end
  end
end
