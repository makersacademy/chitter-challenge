class AddName < ActiveRecord::Migration[5.2]
  def change
    add_column :peeps, :name, :string
  end
end
