require 'database_connect'
class User 

  def self.add(name:,username:, text:, date_time:)
    Peep.create_connection
    @connection.exec("INSERT INTO peeps (name,username,text,date_time) 
                      VALUES ('#{name}','#{username}','#{text}', '#{date_time}')")
  end 
end 