require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

    include Rack::Test::Methods 

    let(:app) { Application.new}
    def reset_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({host: '127.0.0.1', dbname: 'chitters_database_test'})
        connection.exec(seed_sql)
    end
    before(:each) do
        reset_tables
    end
    context 'test to see' do
        it "if chitter time and name is returned" do
            responses = get('/peeps')
            expect(responses.status).to eq(200)
            expect(responses.body).to include("<h1>bob: Hey guys happy monday. sent: 1.13</h1>")
        end
        it "if chitter time and name is returned for Annad" do
            responses = get('/peeps')
            expect(responses.status).to eq(200)
            expect(responses.body).to include("<h1>Annad: Yea I had some chocolate. sent: 3.25</h1>")
        end
    end
    #context "creates new" do
        #it "peep" do
            #responses = post('/create')
            #expect(responses.status).to eq(200)
        #end
    #end
    
end