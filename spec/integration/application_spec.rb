require 'spec_helper'
require 'rack/test'
require_relative '../../app'


describe  Application do
  include Rack::Test::Methods
  let(:app) { Application.new }
  context "GET /" do
    it 'should return the list of messages' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Shame to miss you Rossita, see you later Moon</p>')
      expect(response.body).to include('<p style="font-size: 12px;font-style:italic" >2022-09-01 11:16:45 // singStar</p>')
    end
  end

  context "POST /" do
    it 'posts a new message' do
      response = post('/?message=Will join you for a walk!&person_id=3') 

      expect(response.status).to eq(200)
      expect(response.body).to eq('')
    end
  end
end