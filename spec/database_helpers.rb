require 'pg'
require_relative '../lib/peep'

def wipe_tables
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
  # connection.exec("TRUNCATE users;")
end


def persisted_data(peep_id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE peep_id = #{peep_id};")
  result.first
end