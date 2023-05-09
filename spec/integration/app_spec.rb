require 'spec_helper'
require 'rack/test'
require_relative '../../app'

class Application
  include Rack::Test::Methods

  let(:app) { Application.new }

end