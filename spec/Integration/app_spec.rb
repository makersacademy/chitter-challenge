require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  
  context 'GET /account_page' do
    it 'should get the form to add a new peep' do
      response = get('/account_page')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="post" action="/peeps">')
      expect(response.body).to include('<input type="text" name="message" />')
      expect(response.body).to include('<input type="text" name="tag" />')
    end
  end

  context 'POST /account_page' do
    it 'should add the new peep' do
      _response = post(
        '/account_page/peeps',
        message: 'Hello world!',
        tag: 'Miles',
      )
      response = get('/account_page')
      expect(response.body).to include('<h3>Add new peep</h3>')
    end
  end

  context 'POST /signup' do
    it 'creates a new user' do
      response = post(
        '/signup',
        email: 'name@email.com',
        password: 'abcde1'
      )
      repo = UserRepository.new

      expect(response.status).to eq(200)
      expect(response.body).to eq ''
      expect(repo.all.length).to eq 1
    end
  end
end