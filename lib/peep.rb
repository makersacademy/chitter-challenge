require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
    adapter:  'postgresql',
    database: 'chitter',
    username: 'postgres',
    password: 'password',
    host:     'localhost'
)

class Peep < ActiveRecord::Base



end