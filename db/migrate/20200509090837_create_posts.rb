class CreatePosts < ActiveRecord::Migration[6.0]
 def self.up
   create_table :posts do |t|
     t.integer :user_id
     t.text :body
     t.timestamps
   end

   create_table :users do |t|
     t.string :username
     t.text :fullname
     t.timestamps
   end
 end

 def self.down
   drop_table :posts
   drop_tabee :users
 end
end
