require 'datampper'
require 'dm-postgres-adapter'

Datamapper::Logger.new($stdout, :debug)
Datamapper.setup(:default, 'postgres://localhost/chitter_test')
Datamapper.finalize
Datamapper.auto_upgrade!
