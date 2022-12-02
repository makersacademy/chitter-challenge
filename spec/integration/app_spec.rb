require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'POST/peeps' do
    it 'posts a peep' do 
      
    end 
  end

  context 'GET/peeps' do
    it 'returns the message and time of all peeps' do 
 
    end 
  end

  context 'POST/create_account' do 
    it 'creates account' do 
  
    end 
  end

  context 'GET/log_in' do 
    it 'logs user into account' do 
      
    end 

  context 'GET/log_out' do 
    it 'logs user out of account' do 

    end 
  end
end 