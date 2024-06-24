# frozen_string_literal: true

require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'cheetboard_test')
  result = connection.query("SELECT * FROM cheets WHERE id = #{id};")
  result.first
end
