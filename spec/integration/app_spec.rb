require "spec_helper"
require "rack/test"
require_relative '../../app'

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

        it 'Has a link to add a new peep' do
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
            expect(response.body).to include ("<input type='text' name='date' id='date'>")
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
            expect(last_message.date).to eq '2020-12-05 00:00:00'
            expect(last_message.author_id).to eq '1'
        end
    end

end