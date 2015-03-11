use Rack::Flash
env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/models/user'
require './lib/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!