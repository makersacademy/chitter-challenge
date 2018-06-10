require_relative './user'
class Peeps
  attr_reader :id, :text, :user

  def initialize(id, user_id, text)
    @id = id
    @text = text
    @user = User.find(user_id)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(peep['id'], peep['user_id'], peep['text'])
    end
  end

  def self.create(options)
    result = DatabaseConnection.query(
      "INSERT INTO peeps(user_id, text)
      VALUES('#{options[:user_id].to_i}','#{options[:text]}')
      RETURNING id, user_id, text;"
    )
    Peeps.new(result[0]['id'], result[0]['user_id'], result[0]['text'])
  end

  def ==(other)
    @id == other.id
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = '#{id.to_i}'"
    )
    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['username'],
      result[0]['name'],
      result[0]['password'],
      )
  end
end
