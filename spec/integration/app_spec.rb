require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET to /' do
    it "returns 200 OK with the right content" do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to eq "Hello world"
    end
  end
end
