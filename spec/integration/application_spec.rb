require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { ChitterApplication.new }

  context "GET to /" do
    it 'seomthing' do
      response = get('/')
      expect(response.body).to include('<h1>Welcome to my page</h1>')
    end
  end
end