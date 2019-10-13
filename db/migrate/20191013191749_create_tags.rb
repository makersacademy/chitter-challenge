class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.timestamps
    end
    add_column(:tags, :user_id, :integer)
    add_column(:tags, :tagger_id, :integer)
    add_column(:tags, :peep_id, :integer)
    add_column(:tags, :read, :boolean)
    add_foreign_key(:tags, :users, column: :user_id)
    add_foreign_key(:tags, :users, column: :tagger_id)
    add_foreign_key(:tags, :peeps, column: :peep_id)
  end
end
