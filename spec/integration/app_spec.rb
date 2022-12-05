require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'user_repository'

def reset_chitter_tables
  seed_sql = File.read('seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    reset_chitter_tables
  end