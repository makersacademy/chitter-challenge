class AmendForeignKeysPosts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :peeps, :users
  end
end
