require 'pg'

class Chitter

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    connection = Chitter.connect
    result_peeps = connection.exec('SELECT * FROM peeps 
    INNER JOIN users ON (peeps.user_id = users.id) ORDER BY "ts" DESC;')
    peep_nested_array = []
    result_peeps.each do |single_peep|
      user_name = single_peep['user_name']
      peep = single_peep['peep']
      ts = single_peep['ts']
      peep_nested_array << [user_name, peep, ts]
    end
    peep_nested_array
  end

  def self.new_peep(user_name, peep)
    connection = Chitter.connect
    user_id = connection.exec("SELECT id FROM users WHERE user_name= '#{user_name}';")
    # for cases where user is new
    if user_id.values == []
      connection.exec("INSERT INTO users (user_name) VALUES('#{user_name}')")
      user_id = connection.exec("SELECT id FROM users 
      WHERE user_name= '#{user_name}'")
    end
    time = Time.now.to_s[0...-6]
    connection.exec("INSERT INTO peeps (user_id, peep, ts) 
    VALUES('#{user_id.getvalue(0, 0)}', '#{peep}', '#{time}');")
  end
end
