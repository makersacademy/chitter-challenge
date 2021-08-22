require 'pg'

class DBConnect

  def self.check_environment
    if ENV['DB_TEST_ENV'] == 'test'
      which_db('chitter_manager_test')
    else
      which_db('chitter_manager')
    end
  end

  def self.which_db(database)
    PG.connect(dbname: "#{database}")
  end

end
