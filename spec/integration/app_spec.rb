require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Chitter do
    include Rack::Test::Methods
    let(:app) { Chitter.new }
  
    def reset_all_tables
        seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
        connection.exec(seed_sql)
    end
  
    before(:each) do 
        reset_all_tables
    end

    context "GET /" do
        it 'displays list of peeps in reverse chronological order' do
            response = get('/')
            regex = /(2023-01-13 15:05:23).*(2023-01-13 14:22:06)/m
            expect(response.body).to match(regex)
            regex = /(Going surfing tomoz, who wants to join, hit me up!).*(First peep on this chit!!!)/m
            expect(response.body).to match(regex)
        end
    end

    
end