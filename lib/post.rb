require 'pg'
require 'date'
require_relative './database_connection'

class Post

  def self.create(message:, created_at:)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end

    DatabaseConnection.query(
      "INSERT INTO posts (message, created_at)
      VALUES ('#{message}', '#{created_at}}')
      RETURNING id, message, created_at")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end

    result = DatabaseConnection.query("SELECT * FROM posts ORDER BY created_at DESC")

    result.map { |post|
      create_date = post["created_at"]
      formatted_date = DateTime.parse(create_date).strftime('%d/%m/%y at %H:%M')

      { message: post["message"],
        created_at: formatted_date
      }
    }
  end

end
