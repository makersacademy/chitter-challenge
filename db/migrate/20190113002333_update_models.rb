class UpdateModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user
  end
end
