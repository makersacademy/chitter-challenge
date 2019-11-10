require 'data_mapper'

DataMapper.setup(:default, 'postgres://localhost/chitter_test')

require './lib/peep'

DataMapper.finalize
DataMapper.auto_upgrade!
