# require_relative "./../spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/')
      expect(response.status).to eq(200)
      # expect(response.body).to eq(expected_response)
    end
  end

  context "POST /login" do
    it 'logs in' do
      response = post(
        '/login',
        username: 'Andy1',
        password: 'password'
      )
      expect(response.body).to include("result=1")
      # expect(response.body).to eq(expected_response)
    end
  end

  context "GET /logout" do
    it 'logs out' do
      response = get(
        '/logout',
        username: 'Andy1',
      )
      expect(response.body).to include('result=out')
      # expect(response.body).to eq(expected_response)
    end
  end

  context "GET /logout" do
    it 'logs out' do
      response = get(
        '/logout',
        username: 'Andy1',
      )
      expect(response.body).to include('result=out')
      # expect(response.body).to eq(expected_response)
    end
  end
end
