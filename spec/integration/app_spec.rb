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

  context 'GET /users/:id' do
    it 'returns user with ID 2' do
      response = get('/users/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Batman</h1>')
      expect(response.body).to include('@batman')
      expect(response.body).to include('<h2>Cheeps</h2>')
      expect(response.body).to include('Fighting crime is more important than music! x')
      expect(response.body).to include('ignore my post from yesterday. need tunes for batmobile. x')
    end
  end



end