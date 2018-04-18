require 'pg'
require 'pry'

class User

  attr_accessor :email, :password, :name, :handle

  def initialize(email, password, name, handle)
    @email = email
    @password = password
    @name = name
    @handle = handle
  end

  def self.create(user)
      if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end

      # connection.exec("INSERT INTO peep (peep_text, name, handle) VALUES('#{peep.peep_text}', '#{peep.name}', '#{peep.handle}');")
    end

end
