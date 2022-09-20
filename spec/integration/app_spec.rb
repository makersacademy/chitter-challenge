require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'date'

# def reset_peeps_table
#   seed_sql = File.read('spec/seeds_peeps_users.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test'})
#   connection.exec(seed_sql)
# end

def session
  last_request.env['rack.session']
end

describe Application do
  before(:each) do 
    reset_peeps_table
  end

  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /peeps' do
    it 'shows htl with all peeps in reverse chronological order' do
      response = get('/peeps')

      expect(response.status).to eq 200
      expect(response.body).to include "<div>Anna peep 2 posted at 2022-09-01 13:47:52 </div>\n  <div>Anna peep 1 posted at 2022-08-17 07:37:16 </div>"
    end
  end

  context 'POST /peeps' do
    it 'should create a new peep from user id 1 if no one is logged in' do
      response = post(
        '/peeps',
        content: 'My new peep',
        date: '2022-09-16 15:44:52'
        # user_id: '1'
      )
      all_peeps = get('/peeps')

      expect(response.status).to eq 302
      expect(response.body).to eq ''
      expect(all_peeps.body).to include 'My new peep'
    end

    it 'should create a new peep from user a logged in user' do
      response1 = response = post(
        '/sign-in',
        email: 'samm@makersacademy.com',
        password: 'password123'
        )
      response2 = post(
        '/peeps',
        content: 'My new peep',
        date: '2022-09-16 15:44:52'
      )
      all_peeps = get('/peeps')
      
      expect(response2.status).to eq 302
      expect(response2.body).to eq ''
      expect(all_peeps.body).to include 'My new peep'
      expect(session[:user_id]).to eq 2
    end
  end

  context 'GET /post' do
    it 'shows a form to post a new peep' do
      response = get('/post')
      expect(response.status).to eq 200
      expect(response.body).to include ('<form method="POST" action="/peeps">')
      expect(response.body).to include ('<input type="text" name="content">')
    end
  end

  context 'GET /sign-up' do
    it 'shows an html sign-up page' do
      response = get('/sign-up')
      expect(response.status).to eq 200
      expect(response.body).to include("<form method='POST' action='/users'> ")
      expect(response.body).to include ("<input type='text', name='name'>")
      expect(response.body).to include ("<input type='text', name='username'>")
      expect(response.body).to include ("<input type='text', name='password'>")
    end
  end

  context 'POST /users' do
    it 'should create a new user' do
      response = post(
        '/users',
        name: 'Marina',
        username: 'marina1',
        email: 'marina@makersacademy.com',
        password: 'marina123'
      )

      expect(response.status).to eq 200
      expect(response.body).to eq ''
    end
  end

  context 'GET /sing-in' do
    it 'displays the sign-in page' do
      response = get('/sign-in')
      expect(response.status).to eq 200
      # expect(response.body).to include("<form method='POST' action='/users'> ")
      expect(response.body).to include ("<input type='text', name='email'>")
      expect(response.body).to include ("<input type='text', name='password'>")
    end
  end

  context 'POST /sign-in' do
    it 'checks the database for user credentials and signs the user in if they are correct' do
      response = post(
        '/sign-in',
        email: 'samm@makersacademy.com',
        password: 'password123'
        )
      expect(response.status).to be 200
      expect(response.body).to include ("You have signed in")
    end
    it 'checks the database for user credentials and gives and error if they are incorrect' do
      response = post(
        '/sign-in',
        email: 'samm@makersacademy.com',
        password: 'password1234'
        )
      expect(response.status).to be 200
      expect(response.body).to include ("Error, please try again")
    end
  end


end