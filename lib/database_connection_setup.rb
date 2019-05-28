require 'data_mapper'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(
    :default, 'postgres://:@localhost/chitter_n_peep_test'
  )
else
  DataMapper.setup(
    :default, 'postgres://:@localhost/chitter_n_peep'
  )
end

DataMapper.finalize
DataMapper.auto_upgrade!
