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
    p new_student.values
    
    # sql = "SELECT * FROM students WHERE username = '#{username}'"
    # results = ActiveRecord::Base.connection.execute(sql)
    # results.values
  end

  def self.all
    connection = DatabaseConnection.setup('chitter_machine_test')
    result = connection.exec('SELECT * FROM students')
    result.map { |student| student['username'] }
  end

  attr_reader :id, :email, :username, :student

  def initialize(email:, username:, student_name:, password:)
    @email = email
    @username = username
    @student_name = student_name
    @password = password
  end

end