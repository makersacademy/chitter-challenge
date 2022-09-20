require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods
  
    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }
  


    describe 'Creating a new peep' do
      context 'GET /' do
        it 'should get the form to add a new peep' do
          response = get('/')
  
          expect(response.status).to eq(200)
          expect(response.body).to include('<form method="POST" action="/peeps">')
          expect(response.body).to include('<input type="text" name="username" />')
          expect(response.body).to include('<input type="text" name="content" />')
        end
      end
  
      context 'POST /peeps' do
        it 'should add the new peep' do
          _response = post(
            '/peeps',
            username: 'jeanbu',
            content: 'Hi there',
          )
  
          response = get('/')
  
          expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
        end
      end
    end
  end