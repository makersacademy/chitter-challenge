module DB
  extend self
  require 'rom-repository'

  def container
    require 'pg'
    if ENV['RACK_ENV'] == 'test'
      db = ENV.fetch('POSTGRESQL_TEST_DB')
      test_settings(db)
    else
      db = ENV.fetch('POSTGRESQL_DB')
      live_settings(db)
    end
  end

  private
  def opts
    {
      username: ENV.fetch('POSTGRESQL_USER'),
      password: ENV.fetch('POSTGRESQL_PASSWORD'),
      encoding: 'UTF8'
    }
  end

  def setup(config)
    ROM.container(config)
  end

  def config(db)
    config = ROM::Configuration.new(:sql, "postgres://localhost/#{db}", opts)
    config.auto_registration('root_dir/db/', namespace: false)
    require './relations/peeps'
    require './relations/users'
    config
  end

  def live_settings(db)
    config = config(db)
    setup(config)
  end

  def test_settings(db)
    config = config(db)
    setup(config)
  end
end
