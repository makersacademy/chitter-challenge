require 'data_mapper'
require 'dm-timestamps'

DataMapper.setup(:default, 'postgres://localhost/chitter_test')

require './lib/peep.rb'

DataMapper.finalize
DataMapper.auto_upgrade!
