require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # setup
  before do
    create_test_peep('Test cooking peep')
    create_test_peep('Test programming peep')
  end

  context 'GET /' do
    it 'shows the list of peeps' do
      response = get('/')

      expect(response.body).to include('Test programming peep')
      expect(response.body).to include('Test cooking peep')
    end
  end

  context 'GET /' do
    xit 'displays the peeps in reverser chronological order' do
      response = get('/')

      expect(response.body).to include('Test cooking peep')
      
    end
  end


  def create_test_peep(username)
    PeepManager.instance.add_peep(
      Peep.new(username,"I'm just a test post. Nothing much to say really.")
    )
  end
end
