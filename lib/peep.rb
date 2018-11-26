require 'pg'
require_relative './database_connection'
require_relative './user'

class Peep
  attr_reader :id, :text, :user_id, :mytime

  def initialize(id:, text:, user_id:, mytime:)
    @id = id
    @text = text
    @user_id = user_id
    @mytime = mytime
  end

  def self.write(user_id:, text:, mytime:)
     peep = DatabaseConnection.query("INSERT INTO peeps (user_id, text) VALUES ('#{user_id}', '#{text}') RETURNING id, mytime, text, user_id;")
     Peep.new(
              id: peep[0]['id'],
              text: peep[0]['text'],
              user_id: peep[0]['user_id'],
              mytime: peep[0]['mytime']
             )
   end

   def self.where(user_id:)
     result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = #{user_id};")
     result.map do |peep|
       Peep.new(
         id: peep['id'],
         text: peep['text'],
         user_id: peep['user_id'],
         mytime: peep['mytime']
       )
     end
   end

end
