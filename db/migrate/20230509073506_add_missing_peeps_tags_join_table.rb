class AddMissingPeepsTagsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table(:peeps, :tags)
  end
end
