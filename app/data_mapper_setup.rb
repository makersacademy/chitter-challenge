env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV["DATABASE_URL"] || postgres_url)

DataMapper.finalize

DataMapper.auto_upgrade!