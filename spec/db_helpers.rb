require 'pg'

def persisted_data(id:, table:)
  DBConnection.setup('chitter_test')
  DBConnection.query("Select * from #{table} where id = #{id}")
end

def truncate_table(table:)
  DBConnection.setup('chitter_test')
  DBConnection.query("delete from #{table}")
end
