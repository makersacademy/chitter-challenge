class SetUpTables < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR, created_at TIMESTAMP);

      CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR, password VARCHAR, name VARCHAR(40));

      ALTER TABLE posts ALTER COLUMN created_at SET DEFAULT now();
    SQL
  end
  def down
    execute <<-SQL
      DROP TABLE posts, users; 
    SQL
  end
end
