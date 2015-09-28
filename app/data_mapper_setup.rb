require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

# require './app/models/link.rb' # require each model individaully - the path may vary
# require './app/models/tag.rb'# depending on your file structure
require './app/models/user.rb'
require './app/models/peep.rb'
require './app/models/reply.rb'
#After declaring your models, you should finalise them
DataMapper.finalize

# However, the databse tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
