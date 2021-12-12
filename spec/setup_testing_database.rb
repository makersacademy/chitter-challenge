# frozen_string_literal: true

require 'pg'
require 'singleton'

class Setup
  include Singleton
  def truncate
    p 'Connecting to chitter_test database...'
    con = PG.connect(dbname: 'chitter_test')
    p 'Cleaning up tables...'
    con.exec('TRUNCATE peeps')
    con.exec('TRUNCATE users')
  end
end
