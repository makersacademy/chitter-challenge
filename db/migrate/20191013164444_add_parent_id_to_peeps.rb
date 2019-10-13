class AddParentIdToPeeps < ActiveRecord::Migration[6.0]
  def change
    add_column(:peeps, :parent_id, :integer)
    add_foreign_key(:peeps, :peeps, column: :parent_id)
  end
end
