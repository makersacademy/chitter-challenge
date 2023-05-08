# these are based on 
# 1) database design 
# 2) database design 
# 3) database design 


class PeepsTable <ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.string :text
      # below adds two columns that are automatically populated: created_at, updated_at
      t.timestamps
      t.integer :user_id
    end

    add_foreign_key :peeps, :users, name: :fk_user,  on_delete: :cascade
  end
end

class UsersTable <ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password
      t.string :email_address
    end
  end
end 


class TagsTable <ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.content :password
    end
  end
end

class PeepsTagsJoinTable <ActiveRecord::Migration[7.0]
  def change
    create_join_table(:peeps, :tags)
  end
end 