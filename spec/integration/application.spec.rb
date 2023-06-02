require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'reset_tables'
require 'user'
require 'post'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  before(:each) do
    reset = ResetTables.new
    reset.reset_posts_table
    reset.reset_users_table
  end

  context 'Get /' do
    it 'returns HTML page' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('Chitter')
    end
  end
  context 'Get /signup' do
    it 'returns signup page' do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include('username')
    end
  end
end
  