require_relative 'database'

class Peeps
   attr_reader :content, :username, :create_ad
   def initialize(content, username, created_at)
     @content = content
     @username = username
     @created_at = created_at
   end

   def self.save(content, user_id)
      Database.execute('INSERT INTO peeps (content, user_id) VALUES ($1, $2)', [content, user_id])
   end
end
