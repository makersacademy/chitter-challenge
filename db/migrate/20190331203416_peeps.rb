class Peeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      # id created by default as PRIMARY KEY
      t.column :user_id, :int
      t.column :peep, :string, :null => false
      t.column :peep_time, :timestamp
    end
    
    execute <<-SQL
      ALTER TABLE peeps
      ADD CONSTRAINT fk_user_id
      FOREIGN KEY (user_id)
      REFERENCES users(id)
      SQL
  end
end