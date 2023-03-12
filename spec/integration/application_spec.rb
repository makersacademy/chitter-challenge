require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

    include Rack::Test::Methods 

    let(:app) { Application.new}
    context 'test to see' do
        it "if webpage is returned" do
            responses = get('/')
            expect(responses.status).to eq(200)
            expect(responses.body).to include("<h1> hello </h1>")
        end
    end
end