require_relative './database_connection'

 class Peep
   attr_reader :id, :text, :user_id

   def initialize(id:, text:, user_id:)
     @id = id
     @text = text
     @user_id = user_id
   end

   def self.create(user_id:, text:)
     peep = DatabaseConnection.query("INSERT INTO peeps (user_id, text) VALUES ('#{user_id}','#{text}') RETURNING id, text, user_id;")
     Peep.new(
              id: peep[0]['id'],
              text: peep[0]['text'],
              user_id: peep[0]['user_id']
             )
   end

end
