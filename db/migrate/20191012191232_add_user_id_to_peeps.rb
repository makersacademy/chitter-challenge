class AddUserIdToPeeps < ActiveRecord::Migration[6.0]
  def change
    ActiveRecord::Base.establish_connection.connection.exec('ALTER TABLE peeps ADD COLUMN user_id;')
    add_foreign_key(:peeps, :users)
  end
end
