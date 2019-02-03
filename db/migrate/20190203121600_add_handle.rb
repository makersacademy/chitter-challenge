class AddHandle < ActiveRecord::Migration[5.2]
  def change
    add_column :peeps, :handle, :string
  end
end
