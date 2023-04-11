require_relative '../../app'
require 'rack/test'
require 'database_connection'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect('chitter_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end
end
