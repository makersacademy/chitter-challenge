require 'users'
require 'users_repo'

def reset_albums_table
  seed_sql = File.read('spec/seeds/chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end
