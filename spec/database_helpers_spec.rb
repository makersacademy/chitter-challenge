# require 'pg'
#
# def persisted_data(id:)
#   connection = PG.connect(dbname: 'peep_manager_test')
#   result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
#   result.first
# end
