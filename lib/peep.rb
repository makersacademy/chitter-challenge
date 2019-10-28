require 'pg'

class Peeps

  def self.view
    connection = PG.connect(dbname: 'chitter_app')
    connection.exec("SELECT users.username, peeps.peep_text, peeps.upload_time FROM peeps, users WHERE peeps.peep_user_id = users.user_id ORDER BY peeps.upload_time DESC;").to_a
  end

  def self.add(peep_text:, peep_user_id:)
    time = Time.new
    upload_time = time.hour.to_s + ":" + time.min.to_s + ":" + time.sec.to_s
    connection = PG.connect(dbname: 'chitter_app')
    connection.exec("INSERT INTO peeps(peep_text, peep_user_id, upload_time) VALUES ('#{peep_text}', #{peep_user_id}, '#{upload_time}');")
  end

end
