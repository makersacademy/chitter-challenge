require 'data_mapper'
require 'dm-postgres-adapter'
require 'mime-types'

require_relative 'models/user.rb'
require_relative 'models/hashtag.rb'
require_relative 'models/usertag.rb'
require_relative 'models/peep.rb'
require_relative 'models/like.rb'
require_relative 'models/comment.rb'
require_relative 'models/image.rb'
require_relative 'models/image_uploader.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper::Model.raise_on_save_failure = true
DataMapper.finalize
DataMapper.auto_upgrade!
