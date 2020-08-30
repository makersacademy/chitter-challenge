class LinkUserToPost < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE posts
      ADD COLUMN user_name VARCHAR references users(name);
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE posts
      DROP COLUMN user_name;
    SQL
  end
end
