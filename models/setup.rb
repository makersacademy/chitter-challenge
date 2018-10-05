if ENV['ENVIRONMENT'] == 'test'
  DataMapper::setup(:default, "postgres://andres@localhost/test_chitter")
else
  DataMapper::setup(:default, "postgres://andres@localhost/chitter")
end
DataMapper.finalize
