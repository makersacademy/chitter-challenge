module DB
  extend self

  def setup


  end

  def connection_to_db
    if ENV['RACK_ENV'] == 'test'
      test_settings
    else
      live_settings
  end

  private
  def live_settings
    require 'pg'
    opts = {
      username: ENV['POSTGRESQL_USER'],
      password: ENV['POSTGRESQL_PASSWORD'],
      encoding: 'UTF8'
    }
    db = ENV.fetch('POSTGRESQL_DB')
    ROM::Configuration.new(:sql, "postgres://localhost/#{db}", opts)
  end

  def test_settings
    require 'pg'
    opts = {
      username: ENV['POSTGRESQL_USER'],
      password: ENV['POSTGRESQL_PASSWORD'],
      encoding: 'UTF8'
    }
    db = ENV.fetch('POSTGRESQL_TEST_DB')
    ROM::Configuration.new(:sql, "postgres://localhost/#{db}", opts)

  end
end
