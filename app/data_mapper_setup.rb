env = ENV["RACK_ENV"] || "development"
require_relative 'models/peep'
require_relative 'models/user'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")




# After declaring your models, you should finalise them
DataMapper.finalize
DataMapper.auto_upgrade!