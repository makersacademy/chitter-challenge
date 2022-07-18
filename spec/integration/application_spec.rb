require "spec_helper"
require "rack/test"
require_relative '../../app'

RSpec.describe Application do


  before(:each) do
    DatabaseConnection.exec(File.read('./seeds/posts_seeds.sql'))
    DatabaseConnection.exec(File.read('./seeds/users_seeds.sql'))
  end 

  include Rack::Test::Methods
  let(:app){Application.new}

  context 'GETs from /' do
    it 'returns the correct content' do

      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('<p> Welcome to Chitter </p>')

    end 
  end 

end 
