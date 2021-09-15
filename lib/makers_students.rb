require 'pg'
require_relative 'database_connection'

class Student
  def self.create(email:, username:, student_name:, password:)
    connection = DatabaseConnection.setup('chitter_machine_test')
    connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('#{email}', '#{username}', '#{student_name}', '#{password}');")    
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