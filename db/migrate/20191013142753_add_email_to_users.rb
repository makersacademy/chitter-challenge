class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :email, limit: 100
    end
  end
end
