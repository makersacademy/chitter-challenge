require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Chitter do
  include Rack::Test::Methods

  let(:app) { Chitter.new }

end