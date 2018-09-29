def set_up
  return if ENV['ENVIRONMENT']
  DataMapper::setup(:default, "postgres://andres@localhost/chitter")
  DataMapper.finalize
end
