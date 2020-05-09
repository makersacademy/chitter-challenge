class CreatePosts < ActiveRecord::Migration[6.0]
 def self.up
   create_table :posts do |t|
     t.string :title
     t.text :body
     t.timestamps
   end
 end

 def self.down
   drop_table :posts
 end
end
