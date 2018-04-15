require_relative 'database'
require 'pry'

class Peeps
   attr_reader :content, :username, :created_at
   def initialize(content, username, created_at)
     @content = content
     @username = username
     @created_at = created_at
   end

   def self.save(content, user_id)
      Database.execute('INSERT INTO peeps (content, user_id) VALUES ($1, $2)', [content, user_id])
   end

   def self.all
     result = Database.execute('SELECT * FROM peeps INNER JOIN users ON (peeps.user_id = users.id)')
     data = result.to_a
     data.map! { |r| self.new(r['content'], r['username'], r['created_at']) }
   end
end
