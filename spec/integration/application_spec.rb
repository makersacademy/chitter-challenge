require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'Always:' do
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
  end

  context 'logged out' do
    context 'GET /conversations' do

      it 'should not provide space to create a new peep' do
        response = get('/conversations')
        expect(response.status).to eq(200)
        expect(response.body).not_to include('<form method="POST" action="/conversations">')
      end

      it 'should provide a button to login' do
        response = get('/conversations')
        expect(response.status).to eq(200)
        expect(response.body).to include('<a href="/login')
      end

      it 'should provide a button to register' do
        response = get('/conversations')
        expect(response.status).to eq(200)
        expect(response.body).to include('<a href="/login')
      end
    end

    context 'GET /conversations/:id' do
      it 'should not provide space to make a reply' do
        response = get('/conversations/1')
        expect(response.body).not_to include('<form method="POST" action="/peeps">')    
      end
    end

    context 'GET /login' do
      xit 'should provide fields to login' do
        
      end
    end
    context 'POST /login' do
      xit 'should validate login details to allow a user to login' do
        
      end

      xit 'should reject invalid details' do
        
      end
    end

    context 'GET /register' do
      xit 'should provide fields to register' do
        
      end
    end
    context 'POST /register' do
      xit 'should validate registration details to allow a user to register and login' do
        
      end

      xit 'should reject invalid details' do
        
      end
    end

  end

  context 'logged in' do
    before(:each) do
      post('/login',
        email:'ad@host.com',
        password:'password1'
      )
    end

    context 'GET /conversations' do
      it 'should provide space to create a new peep' do
        response = get('/conversations')
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/conversations">')
        expect(response.body).to include('<input type="text" name="content" />')
      end

      it 'should not provide a button to login' do
        response = get('/conversations')
        expect(response.status).to eq(200)
        expect(response.body).not_to include('<a href="/login')
      end

      it 'should not provide a button to register' do
        response = get('/conversations')
        expect(response.status).to eq(200)
        expect(response.body).not_to include('<a href="/login')
      end

      xit 'should provide a logout button that logs you out when clicked' do
        
      end
    end

    context 'GET /conversations/:id' do
      it 'should provide space to make a reply' do
        post('/login',
          email:'ad@host.com',
          password:'password1'
        )
        response = get('/conversations/1')
        expect(response.body).to include('<form method="POST" action="/peeps">')  
      end
    end
      
    context 'POST /conversations' do
      it 'should post a new conversation with the correct details' do
        post(
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

end