require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET/peeps' do
    it 'returns the message and time and user of all peeps' do 
      response = get('/peeps')
      
      expect(response.status).to eq 200

      expect(response.body).to include 'Eating Breakfast'
      expect(response.body).to include '2002-12-02 08:23:54'
      expect(response.body).to include 'callum@gmail.com'
    end 
  end

  context 'POST/peeps' do
    it 'posts a peep' do 
      response = post('/peeps',
      message: 'Craving chocolate',
      created_at: '2002-12-02 14:32:09',
      user_id: 2)

      expect(response.status).to eq 201

      response = get('/peeps')
      expect(response.body).to include 'Craving chocolate'
      expect(response.body).to include '2002-12-05 14:32:09'
      expect(response.body).to include 'cecily@gmail.com'
    end 
  end

  context 'POST/create_account' do 
    it 'creates account' do 
      response = post('users',
      email_address: 'april@gmail.com',
      password: 'sims2_Pets'
    )
    

    end 
  end

  context 'GET/log_in' do 
    it 'logs user into account' do 
      
    end 
  end 

  context 'GET/log_out' do 
    it 'logs user out of account' do 

    end 
  end
end
