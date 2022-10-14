require_relative '../spec_helper'
require 'rack/test'
require_relative '../../app.rb'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before :each do 
    user = User.create(
      id: 1,
      first_name: 'Dolly',
      last_name: 'See',
      email: 'dolly@dmail.com',
      username: 'dolly',
      password: 'abcde12345',
      password_confirmation: 'abcde12345'
    )

    peep1 = Peep.create(id: 1,
      content: 'Beautyful day',
      created_at: '2022-10-09 13:00:48 UTC',
      user_id: 1
    )
    peep2 = Peep.create(id: 2,
      content: 'Peep test',
      created_at: '2022-10-09 13:40:48 UTC',
      user_id: 1
    )
  end
  
  context 'GET /peeps' do
    it 'returns list of peeps with written time and username' do
      @response = get('/peeps') 
      
      test_body('dolly')
      test_body('Peep test, 2022-10-09 13:40:48 UTC')
      test_body('dolly')
      test_body('Beautyful day, 2022-10-09 13:00:48 UTC')
    end
  end
end

private 

def respond_ok?
  expect(@response.status).to eq (200)
end

def test_body(context)
  expect(@response.body).to include(context) 
end