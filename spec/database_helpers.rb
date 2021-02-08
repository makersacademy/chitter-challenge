# require 'pg'

# def persisted_data(id:, table:)
#   connection = PG.connect(dbname: 'peeps_manager_test')
#   result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
#   result.first
# end