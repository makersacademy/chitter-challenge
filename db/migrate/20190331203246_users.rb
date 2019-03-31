class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # id created by default as PRIMARY KEY
      t.column :name, :string
      t.column :username, :string, :uniqueness => true, :null => false
      t.column :email, :string, :uniqueness => true, :null => false
      t.column :peep, :string, :null => false
    end
  end
end
