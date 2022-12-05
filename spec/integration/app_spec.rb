require "spec_helper"
require "rack/test"
require_relative '../../app'
require_relative '../../lib/database_connection'

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

      expect(response.body).to include '<h1>Chitter</h1>'
      expect(response.body).to include '<h2>Peeps</h2>'
      expect(response.body).to include 'Eating Breakfast'
      expect(response.body).to include '2002-12-04 10:23:54'
      expect(response.body).to include 'callum@gmail.com'
      expect(response.body).to include '<a href="/peeps/create">Create a new Peep</a>'
    end 
  end

  context 'GET/peeps/create' do 
    it 'asks for peep message to post' do
      response = get('/peeps/create')
     
      expect(response.status).to eq 200

      expect(response.body).to include '<label>Enter your peep message here:</label>'
      expect(response.body).to include '<input type="text" name="message" />'
      expect(response.body).to include '<input type="submit" />'
    end
  end

  context 'POST /peeps/create' do
    it 'posts a peep' do 
      response = post('/peeps/create',
      message: 'Craving chocolate',
      user_id: 2)

      expect(response.status).to eq(302)

      response = get('/peeps')
      expect(response.body).to include 'Craving chocolate'
      expect(response.body).to include 'cecily@gmail.com'
    end 
  end

  context 'GET /users/create' do 
    it 'asks for user to sign up' do
      response = get('/users/create')
     
      expect(response.status).to eq 200

      expect(response.body).to include '<h1>Welcome to Chitter</h1'
      expect(response.body).to include '<label>Email addess:</label>'
      expect(response.body).to include '<label>Password:</label>'
      expect(response.body).to include '<input type="text" name="password" />'
      expect(response.body).to include '<input type="submit" />'
    end 
  end 

   context 'POST /users/create' do 
    it 'creates account' do 
      response = post('users/create',
        email_address: 'april@gmail.com',
        password: 'sims2_Pets'
      )

      expect(response.status).to eq 302

      sql = 'SELECT * FROM users'
      result_set = DatabaseConnection.exec_params(sql, [])

      new_user = result_set.to_a.last
      expect(new_user['email_address']).to eq 'april@gmail.com'
      expect(new_user['password']).to eq 'sims2_Pets'
     end 
  end

  context 'GET/log_in' do 
    it 'logs user into account' do 
      response = post('users/log_in',
        email_address: 'callum@gmail.com',
        password: 'God0fwar!'
      )

        expect(response.status).to eq 200

        response = get('/peeps')
        expect(response.body).to inlude 'Eating Breakfast'
        expect(response.body).to inlude '2002-12-04 10:23:54'
        expect(response.body).to inlude '<a href="/peeps/create">Create a new Peep</a>'
    end 
  end 

  # context 'GET/log_out' do 
  #   it 'logs user out of account' do 

  #   end 
  # end
end
