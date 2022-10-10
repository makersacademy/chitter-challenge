require "spec_helper"
# require "rack/test"
require_relative '../../app'

describe Application do
    # This is so we can use rack-test helper methods.
    # include Rack::Test::Methods
  
    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

    context 'GET / ' do 
        it 'Returns home/login page' do
            response = get('/')

            expect(response.body).to include('Hello!')
        end
    end

end