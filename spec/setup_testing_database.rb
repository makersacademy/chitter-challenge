# frozen_string_literal: true

require 'pg'
require 'singleton'
require_relative './../lib/database_connection'

def truncate
  p 'Connecting to chitter_test database...'
  DatabaseConnection.setup('chitter_test')
  p 'Cleaning up tables...'
  DatabaseConnection.query('TRUNCATE peeps')
  DatabaseConnection.query('TRUNCATE users')
end
