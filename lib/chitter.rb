require 'pg'

class Chitter
  def self.all
    connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |bookmark| bookmark['post'] }
    # [
    #   "This is my first Chitter post!",
    #   "This is my second Chitter post!", 
    #   "This is my third Chitter post!"
    # ]
  end 
end
