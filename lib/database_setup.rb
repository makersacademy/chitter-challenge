if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, "postgres://localhost/chitter_test.db")
else
  DataMapper.setup(:default, "postgres://localhost/chitter.db")
end
