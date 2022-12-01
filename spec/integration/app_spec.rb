require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'shows a page of peeps' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Peeps</h1>'
      expect(response.body).to include '<p>jude94: First peep ever on chitter!!!!</p>'
      expect(response.body).to include 'mo**11: Eleven is bigger than ten'
      expect(response.body).to include 'mo**11: I wonder if chitter will ever catch on'
      expect(response.body).to include '2022-11-30 12:03:00'
      expect(response.body).to include '2022-11-30 12:07:00'
      expect(response.body).to include '2022-11-30 12:00:00'
    end
    it 'shows a log in / sign up option' do
    end
    it 'does not show the option to add a peep or comment' do
    end
  end


end
