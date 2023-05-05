require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_users_table
    reset_peeps_table
  end

  describe 'GET /' do
    it 'returns 200 OK' do
      response = get('/')
      expect(response.status).to eq 200
    end

    it 'returns returns html with all peeps' do
      response = get('/')

      expect(response.body).to include '<h1>All Peeps</h1>'
      
      expect(response.body).to include 'content_1'
      expect(response.body).to include '2023-05-01 17:15:32'
      expect(response.body).to include 'username_1'

      expect(response.body).to include 'content_3'
      expect(response.body).to include '2022-06-21 00:01:02'
      expect(response.body).to include 'username_3'

      expect(response.body).to include 'content_4'
      expect(response.body).to include '2022-06-21 22:01:02'
      expect(response.body).to include 'username_4'
    end

    it 'returns html with link to sign up' do
      response = get('/')
      expect(response.body).to include '<a href="/sign-up">Sign Up</a>'
    end
    
    it 'returns html with link to post a new peep' do
      response = get('/')
      expect(response.body).to include '<a href="/new-peep">Add new peep</a>'
    end
  end

  describe 'GET /sign-up' do
    xit 'returns 200 OK' do
    end

    xit 'returns html with sign up form using POST /sign-up route' do
    end

    xit 'returns html with link back to homepage' do
    end
  end

  describe 'GET /new-peep' do
    xit 'returns 200 OK' do
    end

    xit 'returns html with new peep form using POST /new-peep route' do
    end

    xit 'returns html with link back to the homepage' do
    end
  end

  describe 'POST /sign-up' do
    context 'when used with valid params' do
      xit 'returns 200 OK' do
      end

      xit 'returns html with success message' do
      end

      xit 'returns html with link back to the homepage' do
      end

      xit 'adds a new user to the database' do
      end
    end

    context 'when used with invalid params' do
      xit 'returns 400 Bad Request' do
      end
      # TODO - Consider invalid params
    end

  end

  describe 'POST /new-peep' do
    context 'when used with valid params' do
      xit 'returns 200 OK' do
      end

      xit 'returns html with success message' do
      end

      xit 'returns html with link back to the homepage' do
      end

      xit 'returns html with option to create another new peep' do
      end

      xit 'adds a new peep to the database' do
      end
    end

    context 'when used with invalid params' do
      xit 'returns 400 Bad Request' do
      end
      # TODO - Consider invalid params
    end
  end
end
