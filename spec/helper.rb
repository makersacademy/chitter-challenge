def truncate_and_add_3_peeps
  first_peep = "'First peep', '01/01/2019 12:00:00'"
  second_peep = "'Second peep', '02/01/2019 12:00:00'"
  third_peep = "'Third peep', '03/01/2019 12:00:00'"
  adapter = DataMapper.repository(:default).adapter
  adapter.execute('TRUNCATE TABLE peeps')
  adapter.execute("INSERT INTO peeps(body, posted_at) VALUES(#{first_peep}), (#{second_peep}), (#{third_peep})")
end
