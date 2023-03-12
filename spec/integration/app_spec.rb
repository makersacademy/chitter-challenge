require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
    include Rack::Test::Methods 
    let(:app) {Application.new}
    context 'GET /peeps' do
        it "returns peeps in reverse order" do
            response = get('/peeps')
            expect(response.status).to eq(200)
            expect(response.body).to eq("Yea I had some chocolate, Did you have any breakfast?, Happy monday to you too!, Hey guys happy monday")
        end
    end
end