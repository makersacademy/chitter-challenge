require 'pg'
require_relative 'database_connection'
class Chits

  def self.all
      result = DatabaseConnection.query("SELECT chits.id,chits.message,chits.date,chits.user_id,users.username,chits.image from chits inner join users on chits.user_id=users.id ORDER BY 3 DESC;")
      result.map do |chit|
        Chits.new(id: chit['id'], message: chit['message'], date: chit['date'], user_id: chit['user_id'], user_name: chit['username'], image: chit['image'])
      end
    end

    def self.create(message:, date:, user_id:, image:)
        result = DatabaseConnection.query("INSERT INTO chits (message, date, user_id, image)
          VALUES('#{message}', '#{date}', '#{user_id}', '#{image}')
          RETURNING id, message, date, user_id")
        Chits.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'], user_id: result[0]['user_id'], image: result[0]['image'])
      end

      def self.delete(id:)
    DatabaseConnection.query("DELETE FROM chits WHERE id='#{id}'")
  end

attr_reader :id, :message, :date, :user_id, :user_name, :image

      def initialize(id:, message:, date:, user_id:, user_name: [nil], image: [nil])
    @id = id
    @message= message
    @date = date
    @user_id = user_id
    @user_name = user_name
    @image = image
  end

end
