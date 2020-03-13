# frozen_string_literal: true

require './lib/database_connection'
require 'pg'

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = #{id};")
end
