require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_user_table
    reset_peeps_table
  end
end
