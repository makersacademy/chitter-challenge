require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

  include Rack::Test::Methods
  let(:app) { Application.new }

  context '/' do
    it 'Should return a html formatted web page including a welcome banner' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Welcome to the Chitter-Sphere!</h1>')
    end

    it 'Should include a photograph/graphic' do
      response = get('/')
      expect(response.body).to include ('<img src=></img>')
    end

    it 'Should include 3 different hyperlinks' do
      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<a href="/peeps">View all peeps</a>')
      expect(response.body).to include ('<a href="/loginpage">Log in</a>')
    end
  end

  context '/peeps' do
    it 'Should display all peeps from all makers within the peeps database formatted in HTML' do
      response = get('/peeps')
      expect(response.status).to eq (200)
      expect(response.body).to include ('HayleyOk')
      expect(response.body).to include ('Another test peep')
      expect(response.body).to include ('2023-07-21 12:25:12')
    end
  end

  context '/loginpage' do
    it 'Should return a login submit form' do
      response = get('/loginpage')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<form method="GET" action="/maker/:id">')
      expect(response.body).to include ('<input type="text" name="username"/>')
      expect(response.body).to include ('<input type="text" name="password"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end
  end

  # context '/maker/:id' do
  #   it 'Should take the user/maker to their own user page' do
      
  #   end

  #   it 'Should return a welcome banner with the correct users name' do

  #   end

  #   it 'Should return an error/fail when username is not present within the DB' do

  #   end

  #   it 'Should return an error/fail when password is incorrect' do

  #   end
  # end

end
