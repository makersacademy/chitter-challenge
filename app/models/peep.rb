require 'pg'

class Peep

  def self.create(post)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    connection.exec_params("INSERT INTO chitter(post) VALUES($1) RETURNING id, post;", [post])
  end 
end