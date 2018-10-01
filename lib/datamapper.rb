require_relative 'user'
require_relative 'peep'

DataMapper.setup(:default, 'postgres://aidanfaria:@localhost/chitter')

DataMapper.auto_upgrade!
