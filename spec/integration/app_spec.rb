require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /feed' do
    it 'returns list of posts' do
      response = get('/feed')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Latest Cheeps</h2>')
      expect(response.body).to include('Hook @captain_hook')
      expect(response.body).to include('<p>I love music! x</p>')
      expect(response.body).to include('<p>2022-10-31 07:15</p>')
    end
  end




end