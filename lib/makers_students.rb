require 'pg'

class Student
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    else
      connection = PG.connect(dbname: 'chitter_machine', user: 'postgres', password: 'password')
    end

    result = connection.exec('SELECT * FROM students')
    result.map { |student| student['username'] }
  end
end