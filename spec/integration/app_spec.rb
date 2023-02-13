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
      expect(response.body).to include 'First peep ever on chitter!!!!'
      expect(response.body).to include 'Eleven is bigger than ten'
      expect(response.body).to include 'I wonder if chitter will ever catch on'
      expect(response.body).to include '2022-11-30 12:03:00'
      expect(response.body).to include '2022-11-30 12:07:00'
      expect(response.body).to include '2022-11-30 12:00:00'
    end
    it 'shows a log in / sign up option' do
      response = get('/')
      expect(response.body).to include '<input type="text" id="username" name="username" class="input-box">'
    end
    it 'does not show the option to add a peep or comment' do
      response = get('/')
      expect(response.body).not_to include '<form action="/new_peep/:user_id" method="post">
      <label for="content">Enter your peep:</label>
      <input type="text" id="content" name="content" class="peep-input">
      <input type="submit" value="Post a new peep">
   </form>'
    end
  end

  context 'GET /logged_in' do
    it 'shows a page of peeps with a logout button and option to peep' do
      login = post('/?username=jude94&password=topsecret123')
      response = get('/logged_in')
      expect(response.status).to eq(200)
      expect(response.body).to include 'First peep ever on chitter!!!!</p>'
      expect(response.body).to include 'Eleven is bigger than ten'
      expect(response.body).to include 'I wonder if chitter will ever catch on'
      expect(response.body).to include '2022-11-30 12:03:00'
      expect(response.body).to include '2022-11-30 12:07:00'
      expect(response.body).to include '2022-11-30 12:00:00'
      expect(response.body).to include "<a href='/'>Click here to sign out</a>"
      expect(response.body).to include "<h3>What do you wanna peep about?</h3>"
    end
  end

  context 'GET /sign_up' do
    it 'returns a page with a sign up form' do
      response = get('/sign_up')
      expect(response.status).to eq(200)
      expect(response.body).to include '<label for="name">Name:</label><br>'
      expect(response.body).to include '<input class="input-box" type="text" id="name" name="name"><br>'
      expect(response.body).to include '<input class="input-box" type="text" id="email_adress" name="email_address"><br>'
      expect(response.body).to include '<label for="username">Username:</label><br>'
      expect(response.body).to include '<input class="input-box" type="password" id="password" name="password">'
      expect(response.body).to include '<input class="button" type="submit" value="Submit">'
    end
  end

  context 'GET /:user_id' do
    it 'shows a users page with their peeps' do
      login = post('/?username=jude94&password=topsecret123')
      response = get('/2')
      expect(response.body).to include 'Something deep and meaningful probably'
      expect(response.body).not_to include '<h3>What do you wanna peep about?</h3>'
      expect(response.body).not_to include '<label for="content">Enter your peep:</label>'
    end

    it 'incudes a peep box if the user is on their own page' do
      login = post('/?username=jude94&password=topsecret123')
      response = get('/1')
      expect(response.body).to include '<h3>What do you wanna peep about?</h3>'
      expect(response.body).to include '<label for="content">Enter your peep:</label>'
      expect(response.body).to include 'First peep ever on chitter!!!!'
    end
  end

  context 'GET /comment/:peep_id' do
    it "shows a peep with all it's comments and an option to add a comment" do
      login = post('/?username=jude94&password=topsecret123')
      response = get('/comment/2')
      expect(response.status).to eq 200
      expect(response.body).to include 'Happy New Year'
      expect(response.body).to include 'abbie236'
      expect(response.body).to include 'Enter comment here'
      expect(response.body).to include 'This is a comment'
      expect(response.body).to include 'I disagree'
    end
  end

  context 'POST /comment/:peep_id' do
    it 'redirects' do
      response = post('/comment/2?content=hello')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      expect(last_request.url).to eql "http://example.org/comment/2?content=hello"
    end
  end

  context 'POST /new_peep/:user_id' do
    it 'redirects' do
      response = post('/new_peep/2?content=comment')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      expect(last_request.url).to eql "http://example.org/new_peep/2?content=comment"
    end
  end

  context 'POST /sign_up' do
    it 'creates a new user and redirects' do
      response = post('/sign_up',
        name: 'aaa',
        email_address: 'abcde',
        username: 'abcde',
        password: 'aaa'
      )
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      expect(last_request.url).to eql "http://example.org/sign_up"
    end
  end
end
