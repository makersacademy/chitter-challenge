# require 'data_mapper'
# require 'dm-postgres-adapter'
#
# def setup_test_connection
#   DataMapper.setup(:default, 'postgres://localhost/chitter_test')
#   DataMapper.finalize
#   DataMapper.auto_migrate!
# end
#
# def setup_prod_connection
#   DataMapper.setup(:default, 'postgres://localhost/chitter')
#   DataMapper.finalize
#   DataMapper.auto_upgrade!
# end
#
# ENV['ENVIRONMENT'] == 'test' ? setup_test_connection : setup_prod_connection
