require_relative 'database_connection'

class Message 
	attr_reader :id, :text, :date, :user_id

	def initialize(id:, text:, date:, user_id:)
		@id = id
		@text = text
		@date = date
		@user_id = user_id
	end

	def self.all
		result = DatabaseConnection.query("SELECT messages.id, messages.text, messages.m_date, users.name FROM messages INNER JOIN users ON messages.user_id = users.id")
		result.map do |chitter|
			Message.new(id: chitter['id'], text: chitter['text'], date: chitter['m_date'], user_id: chitter['name'])
		end
	end

	def self.create(text:, m_date:, user_id:)
		result = DatabaseConnection.query("INSERT INTO messages (text, m_date, user_id) VALUES ('#{text}', '#{m_date}', #{user_id}) RETURNING id, text, m_date, user_id;")
		Message.new(id: result[0]['id'], text: result[0]['text'], date: result[0]['m_date'], user_id: result[0]['user_id'])
	end
end