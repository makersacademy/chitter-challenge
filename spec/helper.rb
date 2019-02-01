def truncate_and_add_3_peeps
  adapter = DataMapper.repository(:default).adapter
  adapter.execute('TRUNCATE TABLE peeps')
  adapter.execute("INSERT INTO peeps(body) VALUES('Hello world!'), ('It''s a me...'), ('Mario!')")
end
