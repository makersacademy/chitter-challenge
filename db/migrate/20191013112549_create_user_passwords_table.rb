class CreateUserPasswordsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_passwords do |t|
      t.string :passhash
      t.string :salt
      t.timestamps
    end
  end
end
