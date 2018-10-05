if ENV['ENVIRONMENT']
  DataMapper::setup(:default, "postgres://andres@localhost/test_chitter")
  DataMapper.finalize
else
  DataMapper::setup(:default, "postgres://andres@localhost/chitter")
  DataMapper.finalize
end
