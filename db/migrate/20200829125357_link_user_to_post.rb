class LinkUserToPost < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE posts
      ADD COLUMN user_id INT references users(id);
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE posts
      DROP COLUMN user_id;
    SQL
  end
end
