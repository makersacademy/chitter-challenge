require './connect_to_database'

class Peep
  attr_reader :text, :created_at, :user_id

  def initialize(text:, created_at:, user_id:)
    @text = text
    @created_at = created_at
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query('select * from peeps order by created_at desc')
    result.map { |peep| Peep.new(text: peep['text'], created_at: peep['created_at'], user_id: peep['user_id']) }
  end

  def self.create(text:, user_id:)
    
    result = DatabaseConnection.query("insert into peeps (text, user_id) values ('#{text}', '#{user_id}') returning id, text, user_id, created_at;")
    Peep.new(text: result[0]['text'], user_id: result[0]['user_id'], created_at: DateTime.parse(result[0]['created_at']))
  end

  def user
    result = DatabaseConnection.query("select * from users where id = #{@user_id};")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end
  
end
