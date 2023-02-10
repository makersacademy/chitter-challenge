require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should currently redirect to /conversations' do
      response = get('/')
      expect(response.status).to eq(302)
    end
  end


  context 'GET /conversations' do
    it 'should display a list of all conversations in reverse chronological order of first peep' do
      response = get('/conversations')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include("Donna - Donut Peeped: ")
      expect(response.body).to include("multi tag")
      expect(response.body).to include('At: ')
      expect(response.body).to include("Donna - Donut Peeped: ")
      expect(response.body).to include("Clean for tags")
      expect(response.body).to include('At: ')
      expect(response.body).to include("Adam - Ad Peeped: ")
      expect(response.body).to include("Second Peep")
      expect(response.body).to include('At: ')
      expect(response.body).to include("Adam - Ad Peeped: ")
      expect(response.body).to include("First Peep")
      expect(response.body).to include('At: ')
    end

    it 'should allow you to click into any peep to see all replies' do
      response = get('/conversations')
      expect(response.status).to eq(200)
      expect(response.body).to include("At: <a href='conversations/1")
      expect(response.body).to include("At: <a href='conversations/2")
      expect(response.body).to include("At: <a href='conversations/3")
      expect(response.body).to include("At: <a href='conversations/4")
    end 

    it 'should provide space to create a new peep' do
      response = get('/conversations')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/conversations">')
      expect(response.body).to include('<input type="text" name="content" />')
    end
  end

  context 'GET /conversations/:id' do
    it 'should display a list of all peeps inside a conversation' do
      response = get('/conversations/2')
      expect(response.status).to eq(200)
      expect(response.body).to include("Adam - Ad Peeped: ")
      expect(response.body).to include("Second Peep")
      expect(response.body).to include('At: ')
      expect(response.body).to include("Bob - Big Peeped: ")
      expect(response.body).to include("First reply")
      expect(response.body).to include('At: ')
    end
  end

  context 'POST /conversations' do
    it 'should post a new conversation with the correct details' do
      response = post(
        '/conversations',
        content:'this is a new peep'
      )
      response = get('/conversations')
      expect(response.body).to include('this is a new peep')     
    end
  end

  context 'POST /peeps' do
    it 'should post a new peep within the current conversation' do
      response = post(
        '/peeps',
        content:'this is a new reply'
      )
      expect(response.status).to eq(302)
    end
  end

end