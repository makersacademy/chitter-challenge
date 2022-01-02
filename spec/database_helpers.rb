require 'pg'
require_relative '../lib/user.rb'
require_relative '../lib/peep.rb'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  return result.first
end

def add_user_to_DB()
  User.add_user(email:'johnsmith@example.com', username:'Johnny S', full_name:'John Smith', password:'password123')
end

def add_peep_to_DB(user_id, body, create_time)
  DatabaseConnection.query("INSERT INTO peeps (user_id, body, create_time) VALUES ($1, $2, $3);", [user_id, body, create_time])
end

def add_five_peeps_to_DB(user_id=1)
  ## helper method that adds five peeps to the database, time intervals are random within one minute
  time_arr = [Time.new]
  4.times {time_arr << Time.new + rand(60) }
    peep_bodies = ['Hey', 'Hi', 'Hello', 'Yo', 'Good day']

    i = 0
    time_arr.each { |time|
      add_peep_to_DB(user_id, peep_bodies[i], time.strftime("%Y-%m-%d %H:%M:%S"))
      i+=1
    }
end