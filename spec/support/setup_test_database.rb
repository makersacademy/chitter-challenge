# frozen_string_literal: true

require 'pg'
require './lib/database_connection'

def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query('TRUNCATE users CASCADE;')
end
