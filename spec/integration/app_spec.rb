require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'user_repository'

def reset_tables
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
  
describe Application do
    before(:each) do 
        reset_tables
    end

    include Rack::Test::Methods
    let(:app) { Application.new }

    context 'GET /' do
        it 'returns status 200 and contains all the posts' do
            response = get('/')

            expect(response.status).to eq 200
            expect(response.body).to include('I had a tasty salad')
        end

        xit 'Has a link to add a new peep' do
            response = get('/')

            expect(response.status).to eq 200
            expect(response.body).to include("<a href='/new-peep'>Add a new peep!</a>")
        end
    end

    context 'GET /new-peep' do
        it 'has a form to add a new peep' do
            response = get('/new-peep')

            expect(response.status).to eq 200
            expect(response.body).to include ("<form method='POST' action='/'>")
            expect(response.body).to include ("<input type='text' name='message' id='message'>")
            expect(response.body).to include ("<input type='text' name='author_id' id='author_id'>")
        end

    end

    context 'POST /' do
        it 'adds the new peep to the db' do
            response = post('/', message: 'TEST MESSAGE', date: '2020-12-05', author_id: 1)

            repo = MessageRepository.new
            all_messages = repo.all
            last_message = all_messages.last

            expect(last_message.message).to eq 'TEST MESSAGE'
            expect(last_message.author_id).to eq '1'
        end
    end

    context 'GET /sign-up' do
        it "has a sign up form on the page" do
            response = get('/sign-up')

            expect(response.status).to eq 200
            expect(response.body).to include ("<form method='POST' action='/thank-you'>")
            expect(response.body).to include ("<input type='text' name='email' id='email'>")
        end
    end

    context 'GET /log-in' do
        it "has a log in form on the page" do
            response = get('/log-in')

            expect(response.status).to eq 200
            expect(response.body).to include ("<form method='POST' action='/done'>")
            expect(response.body).to include ("<input type='text' name='email' id='email'>")
        end

    end

    context 'POST /done' do
        it 'checks if the email exists in the db' do
            response = post('/done', email: 'bla@email.com', password: 'test')
            expect(response.status).to eq 200
            expect(response.body).to include "This email doesn't exist, sign up instead."
        end

        it "says that the password is incorrect" do
            response = post('/done', email:'irina@email.com', password: 'nothing')
            expect(response.status).to eq 200
            expect(response.body).to include "The password is incorrect or the email doesn't exist."
        end
    end

    context 'POST /thank-you' do
        it 'adds a new user to the db' do
            response = post('/thank-you', name: 'Test Name', email: 'Test Email', password: '56789')
            repo = UserRepository.new
            last_user = repo.all.last

            expect(response.status).to eq 200
            expect(last_user.name).to eq 'Test Name'
            expect(last_user.email).to eq 'Test Email'
            expect(BCrypt::Password.new(last_user.password)).to eq '56789'
        end
    end

end