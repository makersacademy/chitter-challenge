# frozen_string_literal: true

require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'duckboard_test')
  result = connection.query("SELECT * FROM quacks WHERE id = #{id};")
  result.first
end
