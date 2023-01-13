require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do 
    include Rack::Test::Methods

    let(:app) {Application.new}

    context 'GET /' do
        it 'returns all peeps and has a sign in and log in options' do 
            response = get('/')

            expect(response.status).to eq(200)
            expect(response.body).to  include('<h1>Chitter</h1>')
        end 
    end
    context 'GET /sign_in' do 
        it 'returns to main page after sign in process' do 
            response = get('/sign_in') 

            expect(response.body).to include('<form action="/sign_in" method="POST">')
        end
    end 
    context 'GET /log_in' do 
        it 'logs the user ' do
            response = get('/log_in')

            expect(response.status).to eq(200)
            expect(response.body).to include('<input type="text" name="email"/> <br> <br>')
        end
    end
    context 'GET /new_peep' do 
        it 'adds new peep to the feed ' do 
            response = get('/new_peep')

            expect(response.status).to eq(200)
            expect(response.body).to include('<form method="POST" action="/new_peep">')
        end 
    end 
    context 'POST /new_peep' do 
        it 'adds new peep' do 
            response = post('/new_peep',
            message: 'lala',
            date: '2023-01-13',
            user_id: '1')
            
            expect(response.status).to eq(200)
          

            response = get('/new_peep')

            expect(response.body).to include('<form method="POST" action="/new_peep">')
        end
    end

end 