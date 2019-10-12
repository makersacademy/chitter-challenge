class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :username, :null => false, unique: true
      t.string :email, :null => false, unique: true
      t.string :password, :null => false
    end
 
    create_table :peeps do |t|
      t.belongs_to :user, index: true
      t.string :content
      t.datetime :published_on, :required => false
      t.timestamps null: false
    end
  end
end
