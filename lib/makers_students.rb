require 'pg'
require_relative 'database_connection'

class Student
  def self.create(email:, username:, student_name:, password:)
    connection = DatabaseConnection.setup('chitter_machine_test')    
    new_student = connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('#{email}', '#{username}', '#{student_name}', '#{password}') RETURNING user_id;")  
    new_student.values[0]
  end

  def self.get_student_id(username:)
    connection = DatabaseConnection.setup('chitter_machine_test')     
    new_student =  connection.exec("SELECT * FROM students WHERE username = '#{username}'")
    new_student.values
  end

  def self.all
    connection = DatabaseConnection.setup('chitter_machine_test')
    result = connection.exec('SELECT * FROM students')
    result.map { |student| student['username'] }
  end

end