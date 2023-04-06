require "spec_helper"
require "rack/test"
require_relative '../../app'

describe ChitterApplication do
  include Rack::Test::Methods
  let(:app) { ChitterApplication.new }

  context "GET to /" do
    it 'gets to the homepage and displays the feed' do
      response = get('/')
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
    end
  end
end