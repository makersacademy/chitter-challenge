require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.query("SELECT * FROM user_chitter WHERE id = '#{id}';")
end


def chitter_persisted_data(chitter_id:)
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.query("SELECT * FROM chitter WHERE chitter_id = '#{chitter_id}';")
end



