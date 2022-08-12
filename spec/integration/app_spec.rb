require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/chitter_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_tables
  end

  context "a context" do
    
  end
  