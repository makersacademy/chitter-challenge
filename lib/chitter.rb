require_relative 'connection'

class Chitter
  def self.all
    connection = determine_connection
    result = connection.exec("SELECT * FROM chitter_db;")
    peeps = result.map { |post| post }.reverse()
    to_return = ""
    peeps.each do |post|
      to_return += 
        "#{post['username']}<br>#{post['peep']}<br>#{post['date']}: #{post['time']}<br><br>"
    end
    to_return
  end

  def self.add(peep, user = 'Anon')
    connection = determine_connection
    connection.exec ("INSERT INTO chitter_db (peep,time,date,username) 
      VALUES ('#{peep}','#{Time.now}','#{Date.today}','#{user}');")
  end

  def self.remove(id)
    connection = determine_connection
    connection.exec("DELETE FROM chitter_db WHERE id = '#{id}';")
  end

end
