def per_test_db_setup
  DataMapper.repository(:default).adapter.execute('TRUNCATE peeps;')
  DataMapper.repository(:default).adapter.execute('TRUNCATE users;')
end
