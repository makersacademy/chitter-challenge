class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :grip, :limit => 60
      t.string :name, :limit => 60
      t.string :email, :limit => 60
      t.string :password, :limit => 255
    end
  end
end
